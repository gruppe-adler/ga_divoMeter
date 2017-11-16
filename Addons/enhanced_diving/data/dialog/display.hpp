class RscPicture;
class RscText;
class RscTitles {
  class slb_divingComputer {
    idd = 1109;
    enableSimulation = 1;
    movingEnable = 0;
    fadeIn=0;
    fadeOut=1;
    duration = 10e10;
    onLoad = "uiNamespace setVariable ['slb_divingComputerUI', _this select 0]";
     class controls {
        class slb_image: RscPicture {
            idc = -1;
            text = QPATHTOF(data\images\divingWatch.paa);
            x = safeZoneX+(safeZoneW*0.71);
            y = safeZoneY+(safeZoneH*0.32);
            w = safeZoneW* 0.30;
            h = safeZoneH* 0.48;
        };
        class slb_distanzeUnit: RscText {
            idc = 1111;
            text = "";
            font = "TahomaB";
            colorText[] = {1,1,1,1};
            sizeEx = 0.03;
            x = (0.816931 * safezoneW) + safezoneX;
            y = (0.450518 * safezoneH) + safezoneY;
            w = 0.02 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class slb_decoTag: slb_distanzeUnit {
            idc = 1112;
            text = "NO DECO";
            colorText[] = {0,1,0,1};
            sizeEx = 0.03;
            x = (0.875 * safezoneW) + safezoneX;
            y = (0.450518 * safezoneH) + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class slb_height: slb_distanzeUnit {
            idc = 1113;
            text = "";
            sizeEx = 0.07;
            x = (0.805 * safezoneW) + safezoneX;
            y = (0.48 * safezoneH) + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.03 * safezoneH;
        };
        class slb_decoFreeTime: slb_distanzeUnit {
            idc = 1114;
            text = "--";
            colorText[] = {0,1,0,1};
            sizeEx = 0.07;
            x = safeZoneX+(safeZoneW*0.87);
            y = safeZoneY+(safeZoneH*0.48);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.03;
        };
        class slb_tts: slb_distanzeUnit {
            idc = 1115;
            text = "TTS";
            colorText[] = {0.29,0.835,0.89,1};
            sizeEx = 0.03;
            x = safeZoneX+(safeZoneW*0.813);
            y = safeZoneY+(safeZoneH*0.525);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.02;
        };
        class slb_diveT: slb_distanzeUnit {
            idc = 1116;
            text = "DIVE-T";
            colorText[] = {0.29,0.835,0.89,1};
            sizeEx = 0.03;
            x = safeZoneX+(safeZoneW*0.87);
            y = safeZoneY+(safeZoneH*0.525);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.02;
        };
        class slb_timeToSurface: slb_distanzeUnit {
            idc = 1117;
            text = "--";
            colorText[] = {0.29,0.835,0.89,1};
            sizeEx = 0.05;
            x = safeZoneX+(safeZoneW*0.813);
            y = safeZoneY+(safeZoneH*0.55);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.03;
        };
        class slb_divingTime: slb_distanzeUnit {
            idc = 1118;
            text = "--";
            colorText[] = {0.29,0.835,0.89,1};
            sizeEx = 0.05;
            x = safeZoneX+(safeZoneW*0.87);
            y = safeZoneY+(safeZoneH*0.55);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.03;
        };
        class slb_o2Percent: slb_distanzeUnit {
            idc = 1119;
            text = "";
            sizeEx = 0.025;
            x = safeZoneX+(safeZoneW*0.785);
            y = safeZoneY+(safeZoneH*0.5);
            w = safeZoneW* 0.025;
            h = safeZoneH* 0.2;
        };
        class slb_pressureUnit: slb_distanzeUnit {
            idc = 1120;
            text = "";
            colorText[] = {0,1,0,1};
            sizeEx = 0.03;
            x = safeZoneX+(safeZoneW*0.813);
            y = safeZoneY+(safeZoneH*0.59);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.03;
        };
        class slb_time: slb_distanzeUnit {
            idc = 1121;
            text = "TIME";
            colorText[] = {0,1,0,1};
            sizeEx = 0.03;
            x = safeZoneX+(safeZoneW*0.88);
            y = safeZoneY+(safeZoneH*0.59);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.03;
        };
        class slb_pressureValue: slb_distanzeUnit {
            idc = 1122;
            text = "---";
            colorText[] = {0,1,0,1};
            sizeEx = 0.07;
            x = safeZoneX+(safeZoneW*0.805);
            y = safeZoneY+(safeZoneH*0.62);
            w = safeZoneW* 0.04;
            h = safeZoneH* 0.03;
        };
        class slb_timeNumber: slb_distanzeUnit {
            idc = 1123;
            text = "00:00";
            colorText[] = {0,1,0,1};
            sizeEx = 0.07;
            x = safeZoneX+(safeZoneW*0.87);
            y = safeZoneY+(safeZoneH*0.62);
            w = safeZoneW* 0.05;
            h = safeZoneH* 0.03;
        };
        class slb_deepStop: slb_distanzeUnit {
            idc = 1124;
            text = "";
            sizeEx = 0.025;
            x = safeZoneX+(safeZoneW*0.903);
            y = safeZoneY+(safeZoneH*0.59);
            w = safeZoneW* 0.04;
            h = safeZoneH* 0.04;
        };
        class slb_emergencyText: slb_distanzeUnit {
            idc = 1125;
            text = "";
            colorText[] = {1,0,0,1};
            sizeEx = 0.035;
            x = safeZoneX+(safeZoneW*0.355);
            y = safeZoneY+(safeZoneH*0.029);
            w = safeZoneW* 1;
            h = safeZoneH* 1;
        };
        class slb_emergencyDepth: slb_distanzeUnit {
            idc = 1126;
            text = "";
            colorText[] = {1,0,0,1};
            sizeEx = 0.05;
            x = safeZoneX+(safeZoneW*0.813);
            y = safeZoneY+(safeZoneH*0.55);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.03;
        };
        class slb_emergencyTime: slb_distanzeUnit {
            idc = 1127;
            text = "";
            colorText[] = {1,0,0,1};
            sizeEx = 0.05;
            x = safeZoneX+(safeZoneW*0.87);
            y = safeZoneY+(safeZoneH*0.55);
            w = safeZoneW* 0.03;
            h = safeZoneH* 0.03;
        };
        class slb_asendBar: RscPicture {
            idc = 1128;
            text = "";
            colorText[] = {};
            sizeEx = 1;
            x = safezoneX + (safezoneW*0.79);
            y = safezoneY + (safezoneH*0.452);
            w = safeZoneW* 0.15;
            h = safeZoneH* 0.23;
        };
        class slb_n2Bar: RscPicture {
            idc = 1129;
            text = "";
            colorText[] = {};
            sizeEx = 1;
            x = safezoneX + (0.916 * safezoneW);
            y = safezoneY + (0.452 * safezoneH);
            w = safeZoneW* 0.07;
            h = safeZoneH* 0.13;
        };
        class slb_emergencyArrowUP: RscPicture {
            idc = 1130;
            text = "";
            colorText[] = {};
            sizeEx = 1;
            x = safezoneX + (0.85 * safezoneW);
            y = safezoneY + (0.5543 * safezoneH);
            w = safeZoneW* 0.015;
            h = safeZoneH* 0.025;
        };
        class slb_emergencyArrowDOWN: RscPicture {
            idc = 1131;
            text = "";
            colorText[] = {};
            sizeEx = 1;
            x = safezoneX + (0.85 * safezoneW);
            y = safezoneY + (0.54 * safezoneH);
            w = safeZoneW* 0.015;
            h = safeZoneH* 0.025;
        };
        class slb_schowChoosenTank: slb_distanzeUnit {
            idc = 1132;
            text = "";
            sizeEx = 0.025;
            x = safeZoneX+(safeZoneW*0.791);
            y = safeZoneY+(safeZoneH*0.485);
            w = safeZoneW* 0.025;
            h = safeZoneH* 0.3;
        };
    };
  };
};
