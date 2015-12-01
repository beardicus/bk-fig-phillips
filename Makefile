# brew install imagemagick --with-jp2

book = beekeepingdiscus01phil


all:out/frontispiece.png \
	$(foreach v, $(shell seq -w 1 190), out/figure-$(v).png)


# download the source zip from the internet archive
src/$(book)_jp2.zip:
	@ mkdir -p $(dir $@)
	curl -L 'https://archive.org/download/$(book)/$(notdir $@)' -o $@.download
	mv $@.download $@


# extract individual pages as needed
src/$(book)_%.jp2: src/$(book)_jp2.zip
	unzip -p src/$(book)_jp2.zip $(book)_jp2/$(notdir $@) > $@


# $(call fig-crop,x,y,w,h,rotate)
define crop
	@ mkdir -p $(dir $@)
	convert $< -colorspace Gray -crop $(3)x$(4)+$(1)+$(2) -rotate $(5) $@
endef


# laboriously crop and rotate each figure
crop/frontispiece.tif: src/$(book)_0008.jp2
	$(call crop,253,315,1958,2870,90)

crop/figure-001.tif: src/$(book)_0031.jp2
	$(call crop,1022,1682,966,1351,0)

crop/figure-002.tif: src/$(book)_0035.jp2
	$(call crop,1047,410,887,1324,0)

crop/figure-003.tif: src/$(book)_0035.jp2
	$(call crop,88,2076,1145,943,0)

crop/figure-004.tif: src/$(book)_0036.jp2
	$(call crop,258,598,1129,1480,0)

crop/figure-005.tif: src/$(book)_0036.jp2
	$(call crop,1114,2354,986,820,0)

crop/figure-006.tif: src/$(book)_0037.jp2
	$(call crop,788,404,1152,1213,0)

crop/figure-007.tif: src/$(book)_0037.jp2
	$(call crop,85,2202,1005,822,0)

crop/figure-008.tif: src/$(book)_0038.jp2
	$(call crop,354,1108,1736,1258,0)

crop/figure-009.tif: src/$(book)_0039.jp2
	$(call crop,785,588,1138,734,0)

crop/figure-010.tif: src/$(book)_0039.jp2
	$(call crop,89,1910,1252,1111,0)

crop/figure-011.tif: src/$(book)_0040.jp2
	$(call crop,293,1051,1155,1335,0)

crop/figure-012.tif: src/$(book)_0041.jp2
	$(call crop,1055,574,937,1329,0)

crop/figure-013.tif: src/$(book)_0041.jp2
	$(call crop,140,2284,1159,698,0)

crop/figure-014.tif: src/$(book)_0045.jp2
	$(call crop,921,1486,1045,1350,0)

crop/figure-015.tif: src/$(book)_0048.jp2
	$(call crop,318,1573,1240,1016,0)

crop/figure-016.tif: src/$(book)_0049.jp2
	$(call crop,679,401,1275,1094,0)

crop/figure-017.tif: src/$(book)_0049.jp2
	$(call crop,98,1755,1270,938,0)

crop/figure-018.tif: src/$(book)_0054.jp2
	$(call crop,378,703,1022,1177,0)

crop/figure-019.tif: src/$(book)_0054.jp2
	$(call crop,1473,2234,742,377,0)

crop/figure-020.tif: src/$(book)_0056.jp2
	$(call crop,346,712,538,1357,0)

crop/figure-021.tif: src/$(book)_0057.jp2
	$(call crop,1498,1329,488,562,0)

crop/figure-022.tif: src/$(book)_0058.jp2
	$(call crop,352,1545,494,368,0)

crop/figure-023.tif: src/$(book)_0059.jp2
	$(call crop,1207,851,770,235,0)

crop/figure-024.tif: src/$(book)_0059.jp2
	$(call crop,124,1978,722,781,0)

crop/figure-025.tif: src/$(book)_0060.jp2
	$(call crop,329,1865,699,1137,0)

crop/figure-026.tif: src/$(book)_0061.jp2
	$(call crop,973,385,1003,1226,0)

crop/figure-027.tif: src/$(book)_0061.jp2
	$(call crop,127,1898,777,540,0)

crop/figure-028.tif: src/$(book)_0061.jp2
	$(call crop,955,2713,1018,307,0)

crop/figure-029.tif: src/$(book)_0062.jp2
	$(call crop,295,416,1241,770,0)

crop/figure-030.tif: src/$(book)_0062.jp2
	$(call crop,300,2215,1006,549,0)

crop/figure-031.tif: src/$(book)_0062.jp2
	$(call crop,1376,1810,711,941,0)

crop/figure-032.tif: src/$(book)_0063.jp2
	$(call crop,926,609,1026,407,0)

crop/figure-033.tif: src/$(book)_0063.jp2
	$(call crop,105,1296,1024,583,0)

crop/figure-034.tif: src/$(book)_0070.jp2
	$(call crop,336,641,1842,965,0)

crop/figure-035.tif: src/$(book)_0070.jp2
	$(call crop,338,1982,770,1206,0)

crop/figure-036.tif: src/$(book)_0077.jp2
	$(call crop,115,702,1857,2137,0)

crop/figure-037.tif: src/$(book)_0078.jp2
	$(call crop,286,1161,1248,1135,0)

crop/figure-038.tif: src/$(book)_0079.jp2
	$(call crop,1097,1064,856,881,0)

crop/figure-039.tif: src/$(book)_0080.jp2
	$(call crop,298,1091,1192,1131,0)

crop/figure-040.tif: src/$(book)_0082.jp2
	$(call crop,327,1759,1796,1183,90)

crop/figure-041.tif: src/$(book)_0082.jp2
	$(call crop,317,475,1796,1126,90)

crop/figure-042.tif: src/$(book)_0088.jp2
	$(call crop,411,184,1637,1533,0)

crop/figure-043.tif: src/$(book)_0088.jp2
	$(call crop,402,1767,1648,1538,0)

crop/figure-044.tif: src/$(book)_0091.jp2
	$(call crop,172,1235,1737,945,0)

crop/figure-045.tif: src/$(book)_0096.jp2
	$(call crop,265,1021,743,1347,0)

crop/figure-046.tif: src/$(book)_0100.jp2
	$(call crop,297,272,699,2852,0)

crop/figure-047.tif: src/$(book)_0104.jp2
	$(call crop,505,324,1425,2789,0)

crop/figure-048.tif: src/$(book)_0100.jp2
	$(call crop,995,281,1087,2850,0)

crop/figure-049.tif: src/$(book)_0107.jp2
	$(call crop,139,302,1881,2784,90)

crop/figure-050.tif: src/$(book)_0135.jp2
	$(call crop,891,1144,1032,1109,0)

crop/figure-051.tif: src/$(book)_0137.jp2
	$(call crop,118,1278,1742,1102,0)

crop/figure-052.tif: src/$(book)_0140.jp2
	$(call crop,319,1205,1024,964,0)

crop/figure-053.tif: src/$(book)_0148.jp2
	$(call crop,303,1216,586,1193,0)

crop/figure-054.tif: src/$(book)_0148.jp2
	$(call crop,1641,854,496,1541,0)

crop/figure-055.tif: src/$(book)_0149.jp2
	$(call crop,969,406,998,1142,0)

crop/figure-056.tif: src/$(book)_0149.jp2
	$(call crop,104,1928,1004,993,0)

crop/figure-057.tif: src/$(book)_0150.jp2
	$(call crop,328,597,965,1111,0)

crop/figure-058.tif: src/$(book)_0150.jp2
	$(call crop,1140,1946,1025,621,0)

crop/figure-059.tif: src/$(book)_0151.jp2
	$(call crop,933,1235,1035,1015,0)

crop/figure-060.tif: src/$(book)_0152.jp2
	$(call crop,308,413,1137,2239,0)

crop/figure-061.tif: src/$(book)_0153.jp2
	$(call crop,1244,937,683,1451,0)

crop/figure-062.tif: src/$(book)_0157.jp2
	$(call crop,330,1195,1359,533,0)

crop/figure-063.tif: src/$(book)_0164.jp2
	$(call crop,356,1049,582,1671,0)

crop/figure-064.tif: src/$(book)_0164.jp2
	$(call crop,1062,898,1131,909,0)

crop/figure-065.tif: src/$(book)_0164.jp2
	$(call crop,1110,1871,1035,856,0)

crop/figure-066.tif: src/$(book)_0165.jp2
	$(call crop,1284,420,680,1649,0)

crop/figure-067.tif: src/$(book)_0165.jp2
	$(call crop,118,2443,1275,803,0)

crop/figure-068.tif: src/$(book)_0174.jp2
	$(call crop,356,1384,1839,1210,0)

crop/figure-069.tif: src/$(book)_0175.jp2
	$(call crop,1379,759,525,2011,0)

crop/figure-070.tif: src/$(book)_0176.jp2
	$(call crop,397,398,766,1351,0)

crop/figure-071.tif: src/$(book)_0176.jp2
	$(call crop,1449,2063,786,751,0)

crop/figure-072.tif: src/$(book)_0177.jp2
	$(call crop,60,411,1853,2495,0)

crop/figure-073.tif: src/$(book)_0179.jp2
	$(call crop,1092,571,859,2192,0)

crop/figure-074.tif: src/$(book)_0180.jp2
	$(call crop,342,394,1018,1142,0)

crop/figure-075.tif: src/$(book)_0180.jp2
	$(call crop,1162,2046,1020,733,0)

crop/figure-076.tif: src/$(book)_0181.jp2
	$(call crop,791,1232,1177,913,0)

crop/figure-077.tif: src/$(book)_0185.jp2
	$(call crop,64,394,1855,2462,0)

crop/figure-078.tif: src/$(book)_0189.jp2
	$(call crop,236,391,1538,2526,90)

crop/figure-079.tif: src/$(book)_0192.jp2
	$(call crop,379,746,1099,2127,0)

crop/figure-080.tif: src/$(book)_0195.jp2
	$(call crop,931,1347,1004,670,0)

crop/figure-081.tif: src/$(book)_0196.jp2
	$(call crop,382,298,1839,2943,0)

crop/figure-082.tif: src/$(book)_0197.jp2
	$(call crop,891,1046,1030,1292,0)

crop/figure-083.tif: src/$(book)_0199.jp2
	$(call crop,900,1092,1028,1303,0)

crop/figure-084.tif: src/$(book)_0203.jp2
	$(call crop,867,590,1068,2106,0)

crop/figure-085.tif: src/$(book)_0204.jp2
	$(call crop,416,946,1729,1389,0)

crop/figure-086.tif: src/$(book)_0206.jp2
	$(call crop,366,823,1835,1815,0)

crop/figure-087.tif: src/$(book)_0207.jp2
	$(call crop,1417,596,470,2453,0)

crop/figure-088.tif: src/$(book)_0210.jp2
	$(call crop,382,871,809,1721,0)

crop/figure-089.tif: src/$(book)_0211.jp2
	$(call crop,1142,942,807,1730,0)

crop/figure-090.tif: src/$(book)_0212.jp2
	$(call crop,324,1347,815,965,0)

crop/figure-091.tif: src/$(book)_0213.jp2
	$(call crop,905,705,1039,2133,0)

crop/figure-092.tif: src/$(book)_0222.jp2
	$(call crop,390,632,1247,2011,0)

crop/figure-093.tif: src/$(book)_0225.jp2
	$(call crop,88,363,1850,2912,0)

crop/figure-094.tif: src/$(book)_0237.jp2
	$(call crop,725,1120,1296,623,0)

crop/figure-095.tif: src/$(book)_0250.jp2
	$(call crop,354,903,1235,1318,0)

crop/figure-096.tif: src/$(book)_0254.jp2
	$(call crop,329,473,1840,2719,90)

crop/figure-097.tif: src/$(book)_0260.jp2
	$(call crop,335,875,900,1638,0)

crop/figure-098.tif: src/$(book)_0270.jp2
	$(call crop,304,1183,1266,1070,0)

crop/figure-099.tif: src/$(book)_0271.jp2
	$(call crop,113,913,1852,1485,0)

crop/figure-100.tif: src/$(book)_0276.jp2
	$(call crop,281,1217,1006,736,0)

crop/figure-101.tif: src/$(book)_0278.jp2
	$(call crop,297,816,1120,509,0)

crop/figure-102.tif: src/$(book)_0278.jp2
	$(call crop,310,1718,777,1124,0)

crop/figure-103.tif: src/$(book)_0278.jp2
	$(call crop,1144,2098,988,744,0)

crop/figure-104.tif: src/$(book)_0279.jp2
	$(call crop,983,865,1027,1928,0)

crop/figure-105.tif: src/$(book)_0282.jp2
	$(call crop,353,1011,759,569,0)

crop/figure-106.tif: src/$(book)_0282.jp2
	$(call crop,1319,801,775,777,0)

crop/figure-107.tif: src/$(book)_0282.jp2
	$(call crop,351,2335,638,875,0)

crop/figure-108.tif: src/$(book)_0282.jp2
	$(call crop,1189,2071,897,1145,0)

crop/figure-109.tif: src/$(book)_0286.jp2
	$(call crop,311,1279,1230,1067,0)

crop/figure-110.tif: src/$(book)_0290.jp2
	$(call crop,309,1212,1012,938,0)

crop/figure-111.tif: src/$(book)_0315.jp2
	$(call crop,1432,1897,555,880,0)

crop/figure-112.tif: src/$(book)_0315.jp2
	$(call crop,128,2207,711,794,0)

crop/figure-113.tif: src/$(book)_0316.jp2
	$(call crop,327,579,673,749,0)

crop/figure-114.tif: src/$(book)_0316.jp2
	$(call crop,1591,1673,572,770,0)

crop/figure-115.tif: src/$(book)_0317.jp2
	$(call crop,1035,1049,928,1154,0)

crop/figure-116.tif: src/$(book)_0333.jp2
	$(call crop,981,2549,1005,445,0)

crop/figure-117.tif: src/$(book)_0334.jp2
	$(call crop,273,659,1125,374,0)

crop/figure-118.tif: src/$(book)_0334.jp2
	$(call crop,1129,1579,975,363,0)

crop/figure-119.tif: src/$(book)_0335.jp2
	$(call crop,1069,357,960,1463,0)

crop/figure-120.tif: src/$(book)_0335.jp2
	$(call crop,179,2128,1151,1070,0)

crop/figure-121.tif: src/$(book)_0336.jp2
	$(call crop,341,1035,684,1128,0)

crop/figure-122.tif: src/$(book)_0338.jp2
	$(call crop,281,641,1895,2210,90)

crop/figure-123.tif: src/$(book)_0340.jp2
	$(call crop,363,1162,1738,970,0)

crop/figure-124.tif: src/$(book)_0341.jp2
	$(call crop,1001,1353,1012,1300,0)

crop/figure-125.tif: src/$(book)_0350.jp2
	$(call crop,317,685,1029,728,0)

crop/figure-126.tif: src/$(book)_0350.jp2
	$(call crop,1163,1567,1006,768,0)

crop/figure-127.tif: src/$(book)_0350.jp2
	$(call crop,578,2589,1324,412,0)

crop/figure-128.tif: src/$(book)_0351.jp2
	$(call crop,1091,404,921,628,0)

crop/figure-129.tif: src/$(book)_0351.jp2
	$(call crop,172,1399,1005,523,0)

crop/figure-130.tif: src/$(book)_0351.jp2
	$(call crop,994,2261,1028,615,0)

crop/figure-131.tif: src/$(book)_0352.jp2
	$(call crop,320,617,1017,613,0)

crop/figure-132.tif: src/$(book)_0352.jp2
	$(call crop,1181,1422,973,564,0)

crop/figure-133.tif: src/$(book)_0352.jp2
	$(call crop,325,2275,978,706,0)

crop/figure-134.tif: src/$(book)_0353.jp2
	$(call crop,730,698,1270,743,0)

crop/figure-135.tif: src/$(book)_0354.jp2
	$(call crop,323,1036,543,1381,0)

crop/figure-136.tif: src/$(book)_0357.jp2
	$(call crop,195,1351,1763,712,0)

crop/figure-137.tif: src/$(book)_0363.jp2
	$(call crop,927,808,1040,1041,0)

crop/figure-138.tif: src/$(book)_0370.jp2
	$(call crop,365,2309,1021,843,0)

crop/figure-139.tif: src/$(book)_0377.jp2
	$(call crop,708,945,1253,820,0)

crop/figure-140.tif: src/$(book)_0378.jp2
	$(call crop,334,1008,1104,1196,0)

crop/figure-141.tif: src/$(book)_0390.jp2
	$(call crop,329,387,1848,2741,90)

crop/figure-142.tif: src/$(book)_0392.jp2
	$(call crop,406,1056,1751,1231,0)

crop/figure-143.tif: src/$(book)_0395.jp2
	$(call crop,677,1742,1265,1032,0)

crop/figure-144.tif: src/$(book)_0396.jp2
	$(call crop,339,944,1769,1593,0)

crop/figure-145.tif: src/$(book)_0399.jp2
	$(call crop,72,788,1860,1998,0)

crop/figure-146.tif: src/$(book)_0415.jp2
	$(call crop,1106,1098,847,1077,0)

crop/figure-147.tif: src/$(book)_0417.jp2
	$(call crop,969,1037,967,1348,0)

crop/figure-148.tif: src/$(book)_0419.jp2
	$(call crop,1363,545,579,1166,0)

crop/figure-149.tif: src/$(book)_0420.jp2
	$(call crop,389,1348,722,1613,0)

crop/figure-150.tif: src/$(book)_0421.jp2
	$(call crop,978,1081,954,1222,0)

crop/figure-151.tif: src/$(book)_0422.jp2
	$(call crop,393,1287,831,1553,0)

crop/figure-152.tif: src/$(book)_0424.jp2
	$(call crop,367,1096,834,1540,0)

crop/figure-153.tif: src/$(book)_0425.jp2
	$(call crop,1356,1481,581,1299,0)

crop/figure-154.tif: src/$(book)_0426.jp2
	$(call crop,427,1833,1173,1109,0)

crop/figure-155.tif: src/$(book)_0429.jp2
	$(call crop,1104,1122,877,1100,0)

crop/figure-156.tif: src/$(book)_0431.jp2
	$(call crop,1216,1401,750,1455,0)

crop/figure-157.tif: src/$(book)_0432.jp2
	$(call crop,358,614,710,934,0)

crop/figure-158.tif: src/$(book)_0432.jp2
	$(call crop,1452,1948,727,1129,0)

crop/figure-159.tif: src/$(book)_0434.jp2
	$(call crop,377,691,878,1410,0)

crop/figure-160.tif: src/$(book)_0435.jp2
	$(call crop,715,1637,1246,1269,0)

crop/figure-161.tif: src/$(book)_0436.jp2
	$(call crop,375,1893,977,1083,0)

crop/figure-162.tif: src/$(book)_0437.jp2
	$(call crop,1256,1449,715,1530,0)

crop/figure-163.tif: src/$(book)_0440.jp2
	$(call crop,350,1210,1845,1086,0)

crop/figure-164.tif: src/$(book)_0441.jp2
	$(call crop,900,689,1043,582,0)

crop/figure-165.tif: src/$(book)_0441.jp2
	$(call crop,86,1655,1853,1177,0)

crop/figure-166.tif: src/$(book)_0442.jp2
	$(call crop,340,1095,1842,1346,0)

crop/figure-167.tif: src/$(book)_0443.jp2
	$(call crop,95,1364,1860,957,0)

crop/figure-168.tif: src/$(book)_0447.jp2
	$(call crop,110,1329,1870,910,0)

crop/figure-169.tif: src/$(book)_0448.jp2
	$(call crop,374,1369,638,867,0)

crop/figure-170.tif: src/$(book)_0453.jp2
	$(call crop,944,1109,998,490,0)

crop/figure-171.tif: src/$(book)_0453.jp2
	$(call crop,250,2355,1526,908,0)

crop/figure-172.tif: src/$(book)_0454.jp2
	$(call crop,535,411,1491,882,0)

crop/figure-173.tif: src/$(book)_0455.jp2
	$(call crop,78,358,1942,2772,0)

crop/figure-174.tif: src/$(book)_0454.jp2
	$(call crop,416,2039,883,942,0)

crop/figure-175.tif: src/$(book)_0454.jp2
	$(call crop,1402,1596,811,1389,0)

crop/figure-176.tif: src/$(book)_0457.jp2
	$(call crop,1024,639,924,867,0)

crop/figure-177.tif: src/$(book)_0457.jp2
	$(call crop,144,1949,1770,1064,0)

crop/figure-178.tif: src/$(book)_0458.jp2
	$(call crop,349,414,931,1024,0)

crop/figure-179.tif: src/$(book)_0458.jp2
	$(call crop,1119,1589,1075,576,0)

crop/figure-180.tif: src/$(book)_0458.jp2
	$(call crop,624,2490,1311,722,0)

crop/figure-181.tif: src/$(book)_0459.jp2
	$(call crop,108,580,1074,656,0)

crop/figure-182.tif: src/$(book)_0459.jp2
	$(call crop,100,1894,710,1122,0)

crop/figure-183.tif: src/$(book)_0459.jp2
	$(call crop,1004,1784,961,1232,0)

crop/figure-184.tif: src/$(book)_0464.jp2
	$(call crop,305,1239,1281,858,0)

crop/figure-185.tif: src/$(book)_0465.jp2
	$(call crop,741,1230,1243,964,0)

crop/figure-186.tif: src/$(book)_0467.jp2
	$(call crop,859,1087,1104,1264,0)

crop/figure-187.tif: src/$(book)_0468.jp2
	$(call crop,331,629,1838,931,0)

crop/figure-188.tif: src/$(book)_0468.jp2
	$(call crop,338,2116,1839,1083,0)

crop/figure-189.tif: src/$(book)_0469.jp2
	$(call crop,1121,1453,846,1511,0)

crop/figure-190.tif: src/$(book)_0470.jp2
	$(call crop,328,1382,752,767,0)


# tweak and convert figures into final output
out/%.png: crop/%.tif
	@ mkdir -p $(dir $@)
	convert $< -level 15%,80% -sharpen 0x1 -bordercolor white -border 50 $@
	optipng $@
