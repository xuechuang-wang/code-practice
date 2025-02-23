#include "wrp_sdk/platforms/bunker/bunker_base.hpp"
#include "../src/stopwatch.h"

#include <cmath>
#include <fstream>

//!  线性自抗扰控制

int main(int argc, char **argv)
{
    std::string device_name;
    int32_t baud_rate = 0;

    if (argc == 2)
    {
        device_name = { argv[1] };
        std::cout << "Specified CAN: " << device_name << std::endl;
    }
    else
    {
        std::cout << "Usage: app_hunter_demo <interface>" << std::endl;
        std::cout << "Example 1: ./app_hunter_demo can0" << std::endl;

        return -1;
    }
    
    //! 将数据存储到 data.txt

    std::ofstream ofs;

    ofs.open("data.txt",std::ios::out|std::ios::app);


    westonrobot::BunkerBase bunker;
    bunker.Connect(device_name);

    westonrobot::StopWatch sw;

    int count = 0;

    double dotX = 0;
    double dotY = 0;
    double dotTheta = 0;
    double x = 0;           //? 移动机器人的初始位置
    double y = 0;           //? 移动机器人的初始位置
    double theta = 0;
    double d = 0.1;        //? 控制器增益
    double Ts = 0.01;      //? 控制周期： 10 ms

    double dotXR = 0;
    double dotYR = 0;
    double dotThetaR = 0;

    double xR = 0;
    double yR = 0;
    double thetaR = 0;
    double vR = 0.4;            //? 给定线速度
    double wR = 0.1;            //? 给定角速度

    double vc = 0;
    double wc = 0;
    double kx = 1;      //? 控制器增益
    double ky = 1;      //? 控制器增益

    double u1 = 0;
    double u2 = 0;   

    //? 扰动参数
    double u = 0.25;
    double f = 0.02;

    double vE = 0; 
    double wE = 0;  

    double v = 0; 
    double w = 0;  

    double z12 = 0;
    double z22 = 0; 

    
    double ds1 = 0;
    double ds2 = 0; 

    //! 定义观测器变量
    double x1 = 0;
    double x2 = 0;
    double x1guji = 0;
    double x2guji = 0;
    double dot_x1guji = 0;
    double dot_X2guji = 0;
    double xd1guji = 0;
    double xd2guji = 0;
    double dot_xd1guji = 0;
    double dot_xd2guji = 0;

    //! 定义观测器参数
    double p = 2.5;
    double beita0 = p*p;   //? p^2
    double beita1 = 2*p;   //? 2p
    double gama0 = p*p;  //? p^2
    double gama1 = 2*p;    //? 2p

    while (true)
    {
        sw.tic();

        westonrobot::BunkerState state = bunker.GetBunkerState();
        // std::cout << "--------------- " << std::endl;
        // std::cout << "count: " << count << std::endl;
        // std::cout << "control mode: " << static_cast<int>(state.control_mode) << std::endl;
        // std::cout << "battery voltage: " << state.battery_voltage << std::endl;
        // std::cout << "velocity (linear, angular): " << state.linear_velocity << ", " << state.angular_velocity << std::endl;
        // std::cout << "--------------- " << std::endl;

        //! 里程计 公式 7
       v = state.linear_velocity;
        w = state.angular_velocity;

        dotTheta = w;
        theta += dotTheta * Ts;   // dotTheta 积分 == theta

        dotX = v * cos(theta) - w * d * sin(theta) + ds1;
        dotY = v * sin(theta) + w * d * cos(theta) + ds2;

        x += dotX * Ts;   
        y += dotY * Ts;


        //* 30 s 之后加入扰动
        if(count < 3000)
        {
            ds1 = 0;
            ds2 = 0;
        }
        else if(count < 7000)
        {
            ds1 = -u * sin(2*M_PI*f*0.01*count);
            ds2 = u * cos(2*M_PI*f*0.01*count);
        }
        else
        {
            ds1 = 0;
            ds2 = 0;
        }

        //! 轨迹规划模块 公式 8
        dotThetaR = wR;
        thetaR += dotThetaR * Ts;
        dotXR = vR * cos(thetaR);
        dotYR = vR * sin(thetaR);

        xR += dotXR * Ts;
        yR += dotYR * Ts;

        //! 误差计算模块 公式 13
    
        double xE = x - xR;     //? x的实际位置 - x的参考位置
        double yE = y - yR;     //? y的实际位置 - y的参考位置
       
        //!  ESO
        x1 = x;                 //? x实际位置
        x2 = y;                 //? y实际位置
        dot_x1guji = u1 + xd1guji - beita1 * (x1guji - x1);
        dot_xd1guji = (-beita0) * (x1guji - x1);

        dot_X2guji = u2 + xd2guji - gama1 * (x2guji - x2);
        dot_xd2guji = (-gama0) * (x2guji - x2);

        x1guji += dot_x1guji * Ts;
        x2guji += dot_X2guji * Ts;
        xd1guji += dot_xd1guji * Ts;
        xd2guji += dot_xd2guji * Ts;

        if(xd1guji >= 2)
        {
            xd1guji = 2;
        }
        if(xd1guji <= -2)
        {
            xd1guji = -2;
        }


        if(xd2guji >= 2)
        {
            xd2guji = 2;
        }
        if(xd2guji <= -2)
        {
            xd2guji = -2;
        }

        //! 控制器设计 公式 15

        u1 = dotXR - kx * xE - xd1guji;
        u2 = dotYR - ky * yE - xd2guji;
       
        vc = cos(theta) * u1 + sin(theta) * u2;
        wc = 1.0/d * (((-sin(theta)) * u1 + cos(theta) * u2));

        if(vc >= 1.5)
        {
            vc = 1.5;           //? vc 的上限
        }
        if (vc <= -1.5)
        {
            vc = -1.5;          //? vc 的下限
        }
        

        if(wc >= 1)
        {
            wc = 1;             //? wc 的上限
        }
        if(wc<=-1)
        {
            wc = -1;            //? wc 的下限
        }

        //! 发送指令
        std::cout << "count: " << count << std::endl;
        // std::cout << "(x, y,theta): " << x << ", " << y << ", " << theta << std::endl;
        // std::cout << "(xR, yR,thetaR): " << xR << ", " << yR  << ", " << thetaR << std::endl;
        // std::cout << "(u1, u2): " << u1 << ", " << u2 << std::endl;
        std::cout << "Motor: (vc, wc)" << "(" << vc << ", " << wc << ")" << std::endl;

        //! 保存数据
        
        ofs << x << ',' << y <<','<< xR << ',' << yR << ',' << xE
        << ',' << yE <<',' << vc << ',' << wc << ',' << vE << ','  << wE << ','<< xd1guji
        << ',' << xd2guji << ',' << theta << ',' << thetaR << std::endl;
        bunker.SetMotionCommand(vc, wc);
        

       

        sw.sleep_until_ms(Ts*1000);
        ++count;

    }
    

    return 0;
}