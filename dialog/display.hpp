class slb_disp {
	idd = 1109;
	name=_slb;
	onLoad = "uiNamespace setVariable ['slb_disp', _this select 0]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	controlsBackground[] = {};
	objects[] = {};
	 class controls {
		class slb_image {
			idc = 1110;
			type = CT_STATIC;
			style = ST_PICTURE;
			colorBackground[] = { };
			colorText[] = { };
			font = puristaBold;
			sizeEx = 0.053;
			x = safeZoneX+(safeZoneW*0.71);
			y = safeZoneY+(safeZoneH*0.32);
			w = safeZoneW* 0.30;
			h = safeZoneH* 0.48;
			text = "\grad_enhancedDiving\images\divingWatch.paa";
		}; 
		class slb_distanzeUnit: SLBRscText {
			idc = 1111;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.03;
			x = (0.816931 * safezoneW) + safezoneX;
			y = (0.450518 * safezoneH) + safezoneY;
			w = 0.02 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class slb_decoTag: SLBRscText {
			idc = 1112;
			text = "";
			font = puristaBold;
			colorText[] = {0,1,0,1};
			sizeEx = 0.03;
			x = (0.86 * safezoneW) + safezoneX;
			y = (0.450518 * safezoneH) + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.02 * safezoneH
		};
		class slb_height: SLBRscText {
			idc = 1113;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.05;
			x = (0.805 * safezoneW) + safezoneX;
			y = (0.48 * safezoneH) + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class slb_decoFreeTime: SLBRscText {
			idc = 1114;
			text = "";
			font = puristaBold;
			colorText[] = {0,1,0,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.87);
			y = safeZoneY+(safeZoneH*0.48);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_tts: SLBRscText {
			idc = 1115;
			text = "";
			font = puristaBold;
			colorText[] = {0,0,1,1};
			sizeEx = 0.03;
			x = safeZoneX+(safeZoneW*0.813);
			y = safeZoneY+(safeZoneH*0.525);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.02;
		};
		class slb_diveT: SLBRscText {
			idc = 1116;
			text = "";
			font = puristaBold;
			colorText[] = {0,0,1,1};
			sizeEx = 0.03;
			x = safeZoneX+(safeZoneW*0.87);
			y = safeZoneY+(safeZoneH*0.525);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.02;
		};
		class slb_timeToSurface: SLBRscText {
			idc = 1117;
			text = "";
			font = puristaBold;
			colorText[] = {0,0,1,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.813);
			y = safeZoneY+(safeZoneH*0.55);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_divingTime: SLBRscText {
			idc = 1118;
			text = "";
			font = puristaBold;
			colorText[] = {0,0,1,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.87);
			y = safeZoneY+(safeZoneH*0.55);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_o2Percent: SLBRscText {
			idc = 1119;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.02;
			x = safeZoneX+(safeZoneW*0.785);
			y = safeZoneY+(safeZoneH*0.5);
			w = safeZoneW* 0.025;
			h = safeZoneH* 0.2;
		};
		class slb_pressureUnit: SLBRscText {
			idc = 1120;
			text = "";
			font = puristaBold;
			colorText[] = {0,1,0,1};
			sizeEx = 0.03;
			x = safeZoneX+(safeZoneW*0.813);
			y = safeZoneY+(safeZoneH*0.59);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_remaingDiveTimeUnit: SLBRscText {
			idc = 1121;
			text = "";
			font = puristaBold;
			colorText[] = {0,1,0,1};
			sizeEx = 0.03;
			x = safeZoneX+(safeZoneW*0.87);
			y = safeZoneY+(safeZoneH*0.59);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_pressureValue: SLBRscText {
			idc = 1122;
			text = "";
			font = puristaBold;
			colorText[] = {0,1,0,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.805);
			y = safeZoneY+(safeZoneH*0.62);
			w = safeZoneW* 0.04;
			h = safeZoneH* 0.03;
		};
		class slb_remaingDiveTime: SLBRscText {
			idc = 1123;
			text = "";
			font = puristaBold;
			colorText[] = {0,1,0,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.87);
			y = safeZoneY+(safeZoneH*0.62);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_deepStop: SLBRscText {
			idc = 1124;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.025;
			x = safeZoneX+(safeZoneW*0.903);
			y = safeZoneY+(safeZoneH*0.59);
			w = safeZoneW* 0.04;
			h = safeZoneH* 0.04;
		};
		class slb_emergencyText: SLBRscText {
			idc = 1125;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.035;
			x = safeZoneX+(safeZoneW*0.355);
			y = safeZoneY+(safeZoneH*0.029);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_emergencyDepth: SLBRscText {
			idc = 1126;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.813);
			y = safeZoneY+(safeZoneH*0.55);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_emergencyTime: SLBRscText {
			idc = 1127;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.87);
			y = safeZoneY+(safeZoneH*0.55);
			w = safeZoneW* 0.03;
			h = safeZoneH* 0.03;
		};
		class slb_asendBar: SLBRscPicture {
			idc = 1128;
			text = "";
			font = puristaLight;
			colorText[] = {};
			sizeEx = 1;
			x = safezoneX + (safezoneW*0.79);
			y = safezoneY + (safezoneH*0.452);
			w = safeZoneW* 0.15;
			h = safeZoneH* 0.23;
		};
		class slb_n2Bar: SLBRscPicture {
			idc = 1129;
			text = "";
			font = puristaLight;
			colorText[] = {};
			sizeEx = 1;
			x = safezoneX + (0.916 * safezoneW);
			y = safezoneY + (0.452 * safezoneH);
			w = safeZoneW* 0.07;
			h = safeZoneH* 0.13;
		};
		class slb_emergencyArrowUP: SLBRscPicture {
			idc = 1130;
			text = "";
			font = puristaLight;
			colorText[] = {};
			sizeEx = 1;
			x = safezoneX + (0.85 * safezoneW);
			y = safezoneY + (0.5543 * safezoneH);
			w = safeZoneW* 0.015;
			h = safeZoneH* 0.025;
		};
		class slb_emergencyArrowDOWN: SLBRscPicture {
			idc = 1131;
			text = "";
			font = puristaLight;
			colorText[] = {};
			sizeEx = 1;
			x = safezoneX + (0.85 * safezoneW);
			y = safezoneY + (0.54 * safezoneH);
			w = safeZoneW* 0.015;
			h = safeZoneH* 0.025;
		};
		class slb_deepStopText: SLBRscText {
			idc = 1132;
			text = "";
			font = puristaBold;
			colorText[] = {1,1,1,1};
			sizeEx = 0.05;
			x = safeZoneX+(safeZoneW*0.783);
			y = safeZoneY+(safeZoneH*0.485);
			w = safeZoneW* 0.025;
			h = safeZoneH* 0.3;
		};
	};
}; 