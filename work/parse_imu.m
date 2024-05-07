function parse_imu(buf)
    clear_all;

    scaleAccel       = 0.00478515625;      % 加速度 [-16g~+16g]    9.8*16/32768
    scaleQuat       = 0.000030517578125;  % 四元数 [-1~+1]         1/32768
    scaleAngle       = 0.0054931640625;    % 角度   [-180~+180]     180/32768
    scaleAngleSpeed  = 0.06103515625;      % 角速度 [-2000~+2000]    2000/32768
    scaleMag         = 0.15106201171875;   % 磁场 [-4950~+4950]   4950/32768
    scaleTemperature = 0.01;               % 温度
    scaleAirPressure = 0.0002384185791;    % 气压 [-2000~+2000]    2000/8388608
    scaleHeight     = 0.0010728836;       % 高度 [-9000~+9000]    9000/8388608

    imu_dat = zeros(1,34);

    if buf(1) == 17
        ctl = uint16(bitor(uint16(bitshift(uint16(buf(3)), 8)), uint16(buf(2))));
        fprintf('subscribe tag: 0x%04x\n',ctl);
        fprintf('ms: %d\n',  bitor(bitor(bitor(bitshift(uint32(buf(7)), 24), bitshift(uint32(buf(6)), 16)), bitshift(uint32(buf(5)), 8)), uint32(buf(4))));

        Len = 8; % 从第8字节开始根据 订阅标识tag来解析剩下的数据
        if bitand(ctl, uint16(0x0001)) ~= 0
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf('\taX: %.3f',tmpX); % x加速度aX
            tmpY = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf('\taY: %.3f',tmpY); % y加速度aY
            tmpZ = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf('\taZ: %.3f\n',tmpZ); % z加速度aZ

            imu_dat(1) = tmpX;
            imu_dat(2) = tmpY;
            imu_dat(3) = tmpZ;
        end

        if bitand(ctl, 0x0002) ~= 0
            tmpX =  double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf("\tAX: %.3f",tmpX) % x加速度AX
            tmpY =  double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len +2;
            fprintf("\tAY: %.3f",tmpY) % y加速度AY
            tmpZ =  double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf("\tAZ: %.3f\n",tmpZ) % z加速度AZ

            imu_dat(3) = tmpX;
            imu_dat(4) = tmpY;
            imu_dat(5) = tmpZ;
        end

        if bitand(ctl, uint16(0x0004)) ~= 0
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAngleSpeed; Len = Len + 2;
            fprintf('\tGX: %.3f',tmpX); % x角速度GX
            tmpY = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAngleSpeed; Len = Len + 2;
            fprintf('\tGY: %.3f',tmpY); % y角速度GY
            tmpZ = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAngleSpeed; Len = Len + 2;
            fprintf('\tGZ: %.3f\n',tmpZ); % z角速度GZ
        
            imu_dat(7) = tmpX;
            imu_dat(8) = tmpY;
            imu_dat(9) = tmpZ;
        end

        if bitand(ctl, uint16(0x0008)) ~= 0
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleMag; Len = Len + 2;
            fprintf('\tCX: %.3f',tmpX); % x磁场CX
            tmpY = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleMag; Len = Len + 2;
            fprintf('\tCY: %.3f',tmpY); % y磁场CY
            tmpZ = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleMag; Len = Len + 2;
            fprintf('\tCZ: %.3f\n',tmpZ); % z磁场CZ
        
            imu_dat(10) = tmpX;
            imu_dat(11) = tmpY;
            imu_dat(12) = tmpZ;
        end

        if bitand(ctl, uint16(0x0010)) ~= 0
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleTemperature; Len = Len + 2;
            fprintf('\ttemperature: %.2f',tmpX); % 温度
        
            tmpU32 = typecast(uint8([buf(Len:Len+2), 0]), 'uint32');
            if bitand(tmpU32, uint32(0x800000)) == uint32(0x800000) % 若24位数的最高位为1则该数值为负数，需转为32位负数，直接补上ff即可
                tmpU32 = bitor(tmpU32, uint32(0xff000000));
            end
            tmpY = double(typecast(tmpU32, 'int32')) * scaleAirPressure; Len = Len + 3;
            fprintf('\tairPressure: %.3f',tmpY); % 气压
        
            tmpU32 = typecast(uint8([buf(Len:Len+2), 0]), 'uint32');
            if bitand(tmpU32, uint32(0x800000)) == uint32(0x800000) % 若24位数的最高位为1则该数值为负数，需转为32位负数，直接补上ff即可
                tmpU32 = bitor(tmpU32, uint32(0xff000000));
            end
            tmpZ = double(typecast(tmpU32, 'int32')) * scaleHeight; Len = Len + 3;
            fprintf('\theight: %.3f\n',tmpZ); % 高度
        
            imu_dat(13) = tmpX;
            imu_dat(14) = tmpY;
            imu_dat(15) = tmpZ;
        end

        if bitand(ctl, uint16(0x0020)) ~= 0
            tmpAbs = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleQuat; Len = Len + 2;
            fprintf('\tw: %.3f',tmpAbs); % w
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleQuat; Len = Len + 2;
            fprintf('\tx: %.3f',tmpX); % x
            tmpY = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleQuat; Len = Len + 2;
            fprintf('\ty: %.3f',tmpY); % y
            tmpZ = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleQuat; Len = Len + 2;
            fprintf('\tz: %.3f\n',tmpZ); % z
        
            imu_dat(16) = tmpAbs;
            imu_dat(17) = tmpX;
            imu_dat(18) = tmpY;
            imu_dat(19) = tmpZ;
        end

        if bitand(ctl, uint16(0x0040)) ~= 0
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAngle; Len = Len + 2;
            fprintf('\tangleX: %.3f',tmpX); % x角度
            tmpY = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAngle; Len = Len + 2;
            fprintf('\tangleY: %.3f',tmpY); % y角度
            tmpZ = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAngle; Len = Len + 2;
            fprintf('\tangleZ: %.3f\n',tmpZ); % z角度
        
            imu_dat(20) = tmpX;
            imu_dat(21) = tmpY;
            imu_dat(22) = tmpZ;
        end
        
        if bitand(ctl, uint16(0x0080)) ~= 0
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) / 1000.0; Len = Len + 2;
            fprintf('\toffsetX: %.3f',tmpX); % x坐标
            tmpY = double(typecast(uint8(buf(Len:Len+1)), 'int16')) / 1000.0; Len = Len + 2;
            fprintf('\toffsetY: %.3f',tmpY); % y坐标
            tmpZ = double(typecast(uint8(buf(Len:Len+1)), 'int16')) / 1000.0; Len = Len + 2;
            fprintf('\toffsetZ: %.3f\n',tmpZ); % z坐标
        
            imu_dat(23) = tmpX;
            imu_dat(24) = tmpY;
            imu_dat(25) = tmpZ;
        end

        if bitand(ctl, uint16(0x0100)) ~= 0
            tmpU32 = typecast(uint8(buf(Len:Len+3)), 'uint32'); Len = Len + 4;
            fprintf('\tsteps: %u\n', tmpU32); % 计步数
            tmpU8 = buf(Len); Len = Len + 1;
            if bitand(tmpU8, uint8(0x01)) ~= 0 % 是否在走路
                fprintf('\twalking yes');
                imu_dat(26) = 100;
            else
                fprintf('\twalking no');
                imu_dat(26) = 0;
            end
            if bitand(tmpU8, uint8(0x02)) ~= 0 % 是否在跑步
                fprintf('\t running yes');
                imu_dat(27) = 100;
            else
                fprintf('\t running no');
                imu_dat(27) = 0;
            end
            if bitand(tmpU8, uint8(0x04)) ~= 0 % 是否在骑车
                fprintf('\t biking yes');
                imu_dat(28) = 100;
            else
                fprintf('\t biking no');
                imu_dat(28) = 0;
            end
            if bitand(tmpU8, uint8(0x08)) ~= 0 % 是否在开车
                fprintf('\t driving yes\n');
                imu_dat(29) = 100;
            else
                fprintf('\t driving no\n');
                imu_dat(29) = 0;
            end
        end

        if bitand(ctl, uint16(0x0200)) ~= 0
            tmpX = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf('\tasX: %.3f',tmpX); % x加速度asX
            tmpY = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf('\tasY: %.3f',tmpY); % y加速度asY
            tmpZ = double(typecast(uint8(buf(Len:Len+1)), 'int16')) * scaleAccel; Len = Len + 2;
            fprintf('\tasZ: %.3f\n',tmpZ); % z加速度asZ
        
            imu_dat(30) = tmpX;
            imu_dat(31) = tmpY;
            imu_dat(32) = tmpZ;
        end
        
        if bitand(ctl, uint16(0x0400)) ~= 0
            tmpU16 = typecast(uint8(buf(Len:Len+1)), 'uint16'); Len = Len + 2;
            fprintf('\tadc: %umv\n',tmpU16); % adc测量到的电压值，单位为mv
            imu_dat(33) = double(tmpU16);
        end
        
        if bitand(ctl, uint16(0x0800)) ~= 0
            tmpU8 = buf(Len); Len = Len + 1;
            fprintf('\tGPIO1  M:%X, N:%X\n',bitshift(tmpU8, -4), bitand(tmpU8, uint8(0x0f)));
            imu_dat(34) = double(tmpU8);
        end

    else
        fprintf('[error] data head not define\n');
    end
end