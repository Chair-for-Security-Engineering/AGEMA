module CRAFT_Top(x, y);
 input [193:0] x;
 output [64:0] y;

 wire [1104:0] t;
  FX FX_inst(.x({t[369], t[368], t[367], t[366], t[365], t[364], t[363], t[362], t[361], t[360], t[359], t[358], t[357], t[356], t[355], t[354], t[353], t[352], t[351], t[350], t[349], t[348], t[347], t[346], t[345], t[344], t[343], t[342], t[341], t[340], t[339], t[338], t[337], t[336], t[335], t[334], t[333], t[332], t[331], t[330], t[329], t[328], t[327], t[326], t[325], t[324], t[323], t[322], t[321], t[320], t[319], t[318], t[317], t[316], t[315], t[314], t[313], t[312], t[311], t[310], t[309], t[308], t[307], t[306], t[305], t[304], t[303], t[302], t[301], t[300], t[299], t[298], t[297], t[296], t[295], t[294], t[293], t[292], t[291], t[290], t[289], t[288], t[287], t[286], t[285], t[284], t[283], t[282], t[281], t[280], t[279], t[278], t[277], t[276], t[275], t[274], t[273], t[272], t[271], t[270], t[269], t[268], t[267], t[266], t[265], t[264], t[263], t[262], t[261], t[260], t[259], t[258], t[257], t[256], t[255], t[254], t[253], t[252], t[251], t[250], t[249], t[248], t[247], t[246], t[245], t[244], t[243], t[242], t[241], t[240], t[239], t[238], t[237], t[236], t[235], t[234], t[233], t[232], t[231], t[230], t[229], t[228], t[227], t[226], t[225], t[224], t[223], t[222], t[221], t[220], t[219], t[218], t[217], t[216], t[215], t[214], t[213], t[212], t[211], t[210], t[209], t[208], t[207], t[206], t[205], t[204], t[203], t[202], t[201], t[200], t[199], t[198], t[197], t[196], t[195], t[194], t[193], t[192], t[191], t[190], t[189], t[188], t[187], t[186], t[185], t[184], t[183], t[182], t[181], t[180], t[179], t[178], t[177], t[176], t[175], t[174], t[173], t[172], t[171], t[170], t[169], t[168], t[167], t[166], t[165], t[164], t[163], t[162], t[161], t[160], t[159], t[158], t[157], t[156], t[155], t[154], t[153], t[152], t[151], t[150], t[149], t[148], t[147], t[146], t[145], t[144], t[143], t[142], t[141], t[140], t[139], t[138], t[137], t[136], t[135], t[134], t[133], t[132], t[131], t[130], t[129], t[128], t[127], t[126], t[125], t[124], t[123], t[122], t[121], t[120], t[119], t[118], t[117], t[116], t[115], t[114], t[113], t[112], t[111], t[110], t[109], t[108], t[107], t[106], t[105], t[104], t[103], t[102], t[101], t[100], t[99], t[98], t[97], t[96], t[95], t[94], t[93], t[92], t[91], t[90], t[89], t[88], t[87], t[86], t[85], t[84], t[83], t[82], t[81], t[80], t[79], t[78], t[77], t[76], t[75], t[74], t[73], t[72], t[71], t[70], t[69], t[68], t[67], t[66], t[65], t[64], t[63], t[62], t[61], t[60], t[59], t[58], t[57], t[56], t[55], t[54], t[53], t[52], t[51], t[50], t[49], t[48], t[47], t[46], t[45], t[44], t[43], t[42], t[41], t[40], t[39], t[38], t[37], t[36], t[35], t[34], t[33], t[32], t[31], t[30], t[29], t[28], t[27], t[26], t[25], t[24], t[23], t[22], t[21], t[20], t[19], t[18], t[17], t[16], t[15], t[14], t[13], t[12], t[11], t[10], t[9], t[8], t[7], t[6], t[5], t[4], t[3], t[2], t[1], t[0]}), .y({t[665], t[664], t[663], t[662], t[661], t[660], t[659], t[658], t[657], t[656], t[655], t[654], t[653], t[652], t[651], t[650], t[649], t[648], t[647], t[646], t[645], t[644], t[643], t[642], t[641], t[640], t[639], t[638], t[637], t[636], t[635], t[634], t[633], t[632], t[631], t[630], t[629], t[628], t[627], t[626], t[625], t[624], t[623], t[622], t[621], t[620], t[619], t[618], t[617], t[616], t[615], t[614], t[613], t[612], t[611], t[610], t[609], t[608], t[607], t[606], t[605], t[604], t[603], t[602], t[601], t[600], t[599], t[598], t[597], t[596], t[595], t[594], t[593], t[592], t[591], t[590], t[589], t[588], t[587], t[586], t[585], t[584], t[583], t[582], t[581], t[580], t[579], t[578], t[577], t[576], t[575], t[574], t[573], t[572], t[571], t[570], t[569], t[568], t[567], t[566], t[565], t[564], t[563], t[562], t[561], t[560], t[559], t[558], t[557], t[556], t[555], t[554], t[553], t[552], t[551], t[550], t[549], t[548], t[547], t[546], t[545], t[544], t[543], t[542], t[541], t[540], t[539], t[538], t[537], t[536], t[535], t[534], t[533], t[532], t[531], t[530], t[529], t[528], t[527], t[526], t[525], t[524], t[523], t[522], t[521], t[520], t[519], t[518], t[517], t[516], t[515], t[514], t[513], t[512], t[511], t[510], t[509], t[508], t[507], t[506], t[505], t[504], t[503], t[502], t[501], t[500], t[499], t[498], t[497], t[496], t[495], t[494], t[493], t[492], t[491], t[490], t[489], t[488], t[487], t[486], t[485], t[484], t[483], t[482], t[481], t[480], t[479], t[478], t[477], t[476], t[475], t[474], t[473], t[472], t[471], t[470], t[469], t[468], t[467], t[466], t[465], t[464], t[463], t[462], t[461], t[460], t[459], t[458], t[457], t[456], t[455], t[454], t[453], t[452], t[451], t[450], t[449], t[448], t[447], t[446], t[445], t[444], t[443], t[442], t[441], t[440], t[439], t[438], t[437], t[436], t[435], t[434], t[433], t[432], t[431], t[430], t[429], t[428], t[427], t[426], t[425], t[424], t[423], t[422], t[421], t[420], t[419], t[418], t[417], t[416], t[415], t[414], t[413], t[412], t[411], t[410], t[409], t[408], t[407], t[406], t[405], t[404], t[403], t[402], t[401], t[400], t[399], t[398], t[397], t[396], t[395], t[394], t[393], t[392], t[391], t[390], t[389], t[388], t[387], t[386], t[385], t[384], t[383], t[382], t[381], t[380], t[379], t[378], t[377], t[376], t[375], t[374], t[373], t[372], t[371], t[370]}));
  R1_ind R1_ind_inst(.x({x[0], x[128], x[64], x[1], x[129], x[65], x[2], x[130], x[66], x[3], x[131], x[67], x[4], x[132], x[68], x[5], x[133], x[69], x[6], x[134], x[70], x[7], x[135], x[71], x[8], x[136], x[72], x[9], x[137], x[73], x[10], x[138], x[74], x[11], x[139], x[75], x[12], x[140], x[76], x[13], x[141], x[77], x[14], x[142], x[78], x[15], x[143], x[79], x[16], x[144], x[80], x[17], x[145], x[81], x[18], x[146], x[82], x[19], x[147], x[83], x[20], x[148], x[84], x[21], x[149], x[85], x[22], x[150], x[86], x[23], x[151], x[87], x[24], x[152], x[88], x[25], x[153], x[89], x[26], x[154], x[90], x[27], x[155], x[91], x[28], x[156], x[92], x[29], x[157], x[93], x[30], x[158], x[94], x[31], x[159], x[95], x[32], x[160], x[96], x[33], x[161], x[97], x[34], x[162], x[98], x[35], x[163], x[99], x[36], x[164], x[100], x[37], x[165], x[101], x[38], x[166], x[102], x[39], x[167], x[103], x[40], x[168], x[104], x[41], x[169], x[105], x[42], x[170], x[106], x[43], x[171], x[107], x[44], x[172], x[108], x[45], x[173], x[109], x[46], x[174], x[110], x[47], x[175], x[111], x[48], x[176], x[112], x[49], x[177], x[113], x[50], x[178], x[114], x[51], x[179], x[115], x[52], x[180], x[116], x[53], x[181], x[117], x[54], x[182], x[118], x[55], x[183], x[119], x[56], x[184], x[120], x[57], x[185], x[121], x[58], x[186], x[122], x[59], x[187], x[123], x[60], x[188], x[124], x[61], x[189], x[125], x[62], x[190], x[126], x[63], x[191], x[127], t[45], t[409], t[408], t[407], t[406], t[40], t[405], t[404], t[403], t[402], t[30], t[397], t[396], t[395], t[394], t[25], t[393], t[392], t[391], t[390], t[20], t[389], t[388], t[387], t[386], t[10], t[381], t[380], t[379], t[378], t[15], t[385], t[384], t[383], t[382], t[5], t[377], t[376], t[375], t[374], t[35], t[401], t[400], t[399], t[398], x[193], t[365], t[665], t[664], t[663], t[662], t[360], t[661], t[660], t[659], t[658], t[355], t[657], t[656], t[655], t[654], t[350], t[653], t[652], t[651], t[650], t[345], t[649], t[648], t[647], t[646], t[340], t[645], t[644], t[643], t[642], t[335], t[641], t[640], t[639], t[638], t[330], t[637], t[636], t[635], t[634], t[325], t[633], t[632], t[631], t[630], t[320], t[629], t[628], t[627], t[626], t[315], t[625], t[624], t[623], t[622], t[310], t[621], t[620], t[619], t[618], t[305], t[617], t[616], t[615], t[614], t[300], t[613], t[612], t[611], t[610], t[295], t[609], t[608], t[607], t[606], t[290], t[605], t[604], t[603], t[602], t[285], t[601], t[600], t[599], t[598], t[280], t[597], t[596], t[595], t[594], t[275], t[593], t[592], t[591], t[590], t[270], t[589], t[588], t[587], t[586], t[265], t[585], t[584], t[583], t[582], t[260], t[581], t[580], t[579], t[578], t[255], t[577], t[576], t[575], t[574], t[250], t[573], t[572], t[571], t[570], t[245], t[569], t[568], t[567], t[566], t[240], t[565], t[564], t[563], t[562], t[235], t[561], t[560], t[559], t[558], t[230], t[557], t[556], t[555], t[554], t[225], t[553], t[552], t[551], t[550], t[220], t[549], t[548], t[547], t[546], t[215], t[545], t[544], t[543], t[542], t[210], t[541], t[540], t[539], t[538], t[205], t[537], t[536], t[535], t[534], t[200], t[533], t[532], t[531], t[530], t[195], t[529], t[528], t[527], t[526], t[190], t[525], t[524], t[523], t[522], t[185], t[521], t[520], t[519], t[518], t[180], t[517], t[516], t[515], t[514], t[175], t[513], t[512], t[511], t[510], t[170], t[509], t[508], t[507], t[506], t[165], t[505], t[504], t[503], t[502], t[160], t[501], t[500], t[499], t[498], t[155], t[497], t[496], t[495], t[494], t[150], t[493], t[492], t[491], t[490], t[145], t[489], t[488], t[487], t[486], t[140], t[485], t[484], t[483], t[482], t[135], t[481], t[480], t[479], t[478], t[130], t[477], t[476], t[475], t[474], t[125], t[473], t[472], t[471], t[470], t[120], t[469], t[468], t[467], t[466], t[115], t[465], t[464], t[463], t[462], t[110], t[461], t[460], t[459], t[458], t[105], t[457], t[456], t[455], t[454], t[100], t[453], t[452], t[451], t[450], t[95], t[449], t[448], t[447], t[446], t[90], t[445], t[444], t[443], t[442], t[85], t[441], t[440], t[439], t[438], t[80], t[437], t[436], t[435], t[434], t[75], t[433], t[432], t[431], t[430], t[70], t[429], t[428], t[427], t[426], t[65], t[425], t[424], t[423], t[422], t[60], t[421], t[420], t[419], t[418], t[55], t[417], t[416], t[415], t[414], t[50], t[413], t[412], t[411], t[410], t[0], t[373], t[372], t[371], t[370]}), .y({t[804], t[803], t[802], t[801], t[800], t[799], t[798], t[797], t[796], t[795], t[794], t[793], t[792], t[791], t[790], t[789], t[788], t[787], t[786], t[785], t[784], t[783], t[782], t[781], t[780], t[779], t[778], t[777], t[776], t[775], t[774], t[773], t[772], t[771], t[770], t[769], t[768], t[767], t[766], t[765], t[764], t[763], t[762], t[761], t[760], t[759], t[758], t[757], t[756], t[755], t[754], t[753], t[752], t[751], t[750], t[749], t[748], t[747], t[746], t[745], t[744], t[743], t[742], t[741], t[740], t[739], t[738], t[737], t[736], t[735], t[734], t[733], t[732], t[731], t[730], t[729], t[728], t[727], t[726], t[725], t[724], t[723], t[722], t[721], t[720], t[719], t[718], t[717], t[716], t[715], t[714], t[713], t[712], t[711], t[710], t[709], t[708], t[707], t[706], t[705], t[704], t[703], t[702], t[701], t[700], t[699], t[698], t[697], t[696], t[695], t[694], t[693], t[692], t[691], t[690], t[689], t[688], t[687], t[686], t[685], t[684], t[683], t[682], t[681], t[680], t[679], t[678], t[677], t[676], t[675], t[674], t[673], t[672], t[671], t[670], t[669], t[668], t[667], t[666]}));
  R2_ind R2_ind_inst(.x({x[0], x[128], x[64], x[1], x[129], x[65], x[2], x[130], x[66], t[51], t[54], t[53], t[52], t[50], t[66], t[69], t[68], t[67], t[65], t[61], t[64], t[63], t[62], t[60], t[56], t[59], t[58], t[57], t[55], x[3], x[131], x[67], x[4], x[132], x[68], x[5], x[133], x[69], x[6], x[134], x[70], t[111], t[114], t[113], t[112], t[110], t[126], t[129], t[128], t[127], t[125], t[121], t[124], t[123], t[122], t[120], t[116], t[119], t[118], t[117], t[115], x[7], x[135], x[71], x[8], x[136], x[72], x[9], x[137], x[73], x[10], x[138], x[74], t[91], t[94], t[93], t[92], t[90], t[106], t[109], t[108], t[107], t[105], t[101], t[104], t[103], t[102], t[100], t[96], t[99], t[98], t[97], t[95], x[11], x[139], x[75], x[12], x[140], x[76], x[13], x[141], x[77], x[14], x[142], x[78], t[71], t[74], t[73], t[72], t[70], t[86], t[89], t[88], t[87], t[85], t[81], t[84], t[83], t[82], t[80], t[76], t[79], t[78], t[77], t[75], x[15], x[143], x[79], x[16], x[144], x[80], x[17], x[145], x[81], x[18], x[146], x[82], t[151], t[154], t[153], t[152], t[150], t[166], t[169], t[168], t[167], t[165], t[161], t[164], t[163], t[162], t[160], t[156], t[159], t[158], t[157], t[155], x[19], x[147], x[83], x[20], x[148], x[84], x[21], x[149], x[85], x[22], x[150], x[86], t[171], t[174], t[173], t[172], t[170], t[186], t[189], t[188], t[187], t[185], t[181], t[184], t[183], t[182], t[180], t[176], t[179], t[178], t[177], t[175], x[23], x[151], x[87], x[24], x[152], x[88], x[25], x[153], x[89], x[26], x[154], x[90], t[191], t[194], t[193], t[192], t[190], t[206], t[209], t[208], t[207], t[205], t[201], t[204], t[203], t[202], t[200], t[196], t[199], t[198], t[197], t[195], x[27], x[155], x[91], x[28], x[156], x[92], x[29], x[157], x[93], x[30], x[158], x[94], t[131], t[134], t[133], t[132], t[130], t[146], t[149], t[148], t[147], t[145], t[141], t[144], t[143], t[142], t[140], t[136], t[139], t[138], t[137], t[135], x[31], x[159], x[95], x[32], x[160], x[96], x[33], x[161], x[97], x[34], x[162], x[98], t[231], t[234], t[233], t[232], t[230], t[246], t[249], t[248], t[247], t[245], t[241], t[244], t[243], t[242], t[240], t[236], t[239], t[238], t[237], t[235], x[35], x[163], x[99], x[36], x[164], x[100], x[37], x[165], x[101], x[38], x[166], x[102], t[251], t[254], t[253], t[252], t[250], t[266], t[269], t[268], t[267], t[265], t[261], t[264], t[263], t[262], t[260], t[256], t[259], t[258], t[257], t[255], x[39], x[167], x[103], x[40], x[168], x[104], x[41], x[169], x[105], x[42], x[170], x[106], t[271], t[274], t[273], t[272], t[270], t[286], t[289], t[288], t[287], t[285], t[281], t[284], t[283], t[282], t[280], t[276], t[279], t[278], t[277], t[275], x[43], x[171], x[107], x[44], x[172], x[108], x[45], x[173], x[109], x[46], x[174], x[110], t[211], t[214], t[213], t[212], t[210], t[226], t[229], t[228], t[227], t[225], t[221], t[224], t[223], t[222], t[220], t[216], t[219], t[218], t[217], t[215], x[47], x[175], x[111], x[48], x[176], x[112], x[49], x[177], x[113], x[50], x[178], x[114], t[331], t[334], t[333], t[332], t[330], t[346], t[349], t[348], t[347], t[345], t[341], t[344], t[343], t[342], t[340], t[336], t[339], t[338], t[337], t[335], x[51], x[179], x[115], x[52], x[180], x[116], x[53], x[181], x[117], x[54], x[182], x[118], t[311], t[314], t[313], t[312], t[310], t[326], t[329], t[328], t[327], t[325], t[321], t[324], t[323], t[322], t[320], t[316], t[319], t[318], t[317], t[315], x[55], x[183], x[119], x[56], x[184], x[120], x[57], x[185], x[121], x[58], x[186], x[122], t[291], t[294], t[293], t[292], t[290], t[306], t[309], t[308], t[307], t[305], t[301], t[304], t[303], t[302], t[300], t[296], t[299], t[298], t[297], t[295], x[59], x[187], x[123], x[60], x[188], x[124], x[61], x[189], x[125], x[62], x[190], x[126], t[351], t[354], t[353], t[352], t[350], t[366], t[369], t[368], t[367], t[365], t[361], t[364], t[363], t[362], t[360], t[356], t[359], t[358], t[357], t[355], x[63], x[191], x[127], t[46], t[49], t[48], t[47], t[45], t[41], t[44], t[43], t[42], t[40], t[31], t[34], t[33], t[32], t[30], t[26], t[29], t[28], t[27], t[25], t[21], t[24], t[23], t[22], t[20], t[11], t[14], t[13], t[12], t[10], t[16], t[19], t[18], t[17], t[15], t[6], t[9], t[8], t[7], t[5], t[36], t[39], t[38], t[37], t[35], x[193], t[1], t[4], t[3], t[2], t[0]}), .y({t[1104], t[1103], t[1102], t[1101], t[1100], t[1099], t[1098], t[1097], t[1096], t[1095], t[1094], t[1093], t[1092], t[1091], t[1090], t[1089], t[1088], t[1087], t[1086], t[1085], t[1084], t[1083], t[1082], t[1081], t[1080], t[1079], t[1078], t[1077], t[1076], t[1075], t[1074], t[1073], t[1072], t[1071], t[1070], t[1069], t[1068], t[1067], t[1066], t[1065], t[1064], t[1063], t[1062], t[1061], t[1060], t[1059], t[1058], t[1057], t[1056], t[1055], t[1054], t[1053], t[1052], t[1051], t[1050], t[1049], t[1048], t[1047], t[1046], t[1045], t[1044], t[1043], t[1042], t[1041], t[1040], t[1039], t[1038], t[1037], t[1036], t[1035], t[1034], t[1033], t[1032], t[1031], t[1030], t[1029], t[1028], t[1027], t[1026], t[1025], t[1024], t[1023], t[1022], t[1021], t[1020], t[1019], t[1018], t[1017], t[1016], t[1015], t[1014], t[1013], t[1012], t[1011], t[1010], t[1009], t[1008], t[1007], t[1006], t[1005], t[1004], t[1003], t[1002], t[1001], t[1000], t[999], t[998], t[997], t[996], t[995], t[994], t[993], t[992], t[991], t[990], t[989], t[988], t[987], t[986], t[985], t[984], t[983], t[982], t[981], t[980], t[979], t[978], t[977], t[976], t[975], t[974], t[973], t[972], t[971], t[970], t[969], t[968], t[967], t[966], t[965], t[964], t[963], t[962], t[961], t[960], t[959], t[958], t[957], t[956], t[955], t[954], t[953], t[952], t[951], t[950], t[949], t[948], t[947], t[946], t[945], t[944], t[943], t[942], t[941], t[940], t[939], t[938], t[937], t[936], t[935], t[934], t[933], t[932], t[931], t[930], t[929], t[928], t[927], t[926], t[925], t[924], t[923], t[922], t[921], t[920], t[919], t[918], t[917], t[916], t[915], t[914], t[913], t[912], t[911], t[910], t[909], t[908], t[907], t[906], t[905], t[904], t[903], t[902], t[901], t[900], t[899], t[898], t[897], t[896], t[895], t[894], t[893], t[892], t[891], t[890], t[889], t[888], t[887], t[886], t[885], t[884], t[883], t[882], t[881], t[880], t[879], t[878], t[877], t[876], t[875], t[874], t[873], t[872], t[871], t[870], t[869], t[868], t[867], t[866], t[865], t[864], t[863], t[862], t[861], t[860], t[859], t[858], t[857], t[856], t[855], t[854], t[853], t[852], t[851], t[850], t[849], t[848], t[847], t[846], t[845], t[844], t[843], t[842], t[841], t[840], t[839], t[838], t[837], t[836], t[835], t[834], t[833], t[832], t[831], t[830], t[829], t[828], t[827], t[826], t[825], t[824], t[823], t[822], t[821], t[820], t[819], t[818], t[817], t[816], t[815], t[814], t[813], t[812], t[811], t[810], t[809], t[808], t[807], t[806], t[805]}));
  Reg1 Reg1_inst(.x({t[733], t[732], t[731], x[192], t[740], t[739], t[738], t[737], t[736], t[735], t[734], t[750], t[749], t[748], t[747], t[804], t[803], t[802], t[801], t[746], t[800], t[799], t[798], t[797], t[796], t[795], t[794], t[793], t[792], t[791], t[745], t[790], t[789], t[788], t[787], t[786], t[785], t[784], t[783], t[782], t[781], t[744], t[780], t[779], t[778], t[777], t[776], t[775], t[774], t[773], t[772], t[771], t[743], t[770], t[769], t[768], t[767], t[766], t[765], t[764], t[763], t[762], t[761], t[742], t[760], t[759], t[758], t[757], t[756], t[755], t[754], t[753], t[752], t[751], t[741]}), .y({t[365], t[360], t[355], t[350], t[345], t[340], t[335], t[330], t[325], t[320], t[315], t[310], t[305], t[300], t[295], t[290], t[285], t[280], t[275], t[270], t[265], t[260], t[255], t[250], t[245], t[240], t[235], t[230], t[225], t[220], t[215], t[210], t[205], t[200], t[195], t[190], t[185], t[180], t[175], t[170], t[165], t[160], t[155], t[150], t[145], t[140], t[135], t[130], t[125], t[120], t[115], t[110], t[105], t[100], t[95], t[90], t[85], t[80], t[75], t[70], t[65], t[60], t[55], t[50], t[45], t[40], t[35], t[30], t[25], t[20], t[15], t[10], t[5], t[0]}));
  Reg2 Reg2_inst(.x({t[848], t[847], t[846], t[845], t[844], t[843], t[842], t[841], t[812], t[811], t[810], t[809], x[192], t[840], t[839], t[838], t[837], t[836], t[835], t[834], t[833], t[832], t[831], t[830], t[829], t[828], t[827], t[826], t[825], t[824], t[823], t[822], t[821], t[820], t[819], t[818], t[817], t[816], t[815], t[814], t[813], t[888], t[887], t[886], t[885], t[884], t[883], t[882], t[881], t[880], t[879], t[878], t[877], t[876], t[875], t[874], t[873], t[1104], t[1103], t[1102], t[1101], t[1100], t[1099], t[1098], t[1097], t[1096], t[1095], t[1094], t[1093], t[1092], t[1091], t[1090], t[1089], t[872], t[871], t[870], t[869], t[1088], t[1087], t[1086], t[1085], t[1084], t[1083], t[1082], t[1081], t[1080], t[1079], t[1078], t[1077], t[1076], t[1075], t[1074], t[1073], t[1072], t[1071], t[1070], t[1069], t[1068], t[1067], t[1066], t[1065], t[1064], t[1063], t[1062], t[1061], t[1060], t[1059], t[1058], t[1057], t[1056], t[1055], t[1054], t[1053], t[1052], t[1051], t[1050], t[1049], t[868], t[867], t[866], t[865], t[1048], t[1047], t[1046], t[1045], t[1044], t[1043], t[1042], t[1041], t[1040], t[1039], t[1038], t[1037], t[1036], t[1035], t[1034], t[1033], t[1032], t[1031], t[1030], t[1029], t[1028], t[1027], t[1026], t[1025], t[1024], t[1023], t[1022], t[1021], t[1020], t[1019], t[1018], t[1017], t[1016], t[1015], t[1014], t[1013], t[1012], t[1011], t[1010], t[1009], t[864], t[863], t[862], t[861], t[1008], t[1007], t[1006], t[1005], t[1004], t[1003], t[1002], t[1001], t[1000], t[999], t[998], t[997], t[996], t[995], t[994], t[993], t[992], t[991], t[990], t[989], t[988], t[987], t[986], t[985], t[984], t[983], t[982], t[981], t[980], t[979], t[978], t[977], t[976], t[975], t[974], t[973], t[972], t[971], t[970], t[969], t[860], t[859], t[858], t[857], t[968], t[967], t[966], t[965], t[964], t[963], t[962], t[961], t[960], t[959], t[958], t[957], t[956], t[955], t[954], t[953], t[952], t[951], t[950], t[949], t[948], t[947], t[946], t[945], t[944], t[943], t[942], t[941], t[940], t[939], t[938], t[937], t[936], t[935], t[934], t[933], t[932], t[931], t[930], t[929], t[856], t[855], t[854], t[853], t[928], t[927], t[926], t[925], t[924], t[923], t[922], t[921], t[920], t[919], t[918], t[917], t[916], t[915], t[914], t[913], t[912], t[911], t[910], t[909], t[908], t[907], t[906], t[905], t[904], t[903], t[902], t[901], t[900], t[899], t[898], t[897], t[896], t[895], t[894], t[893], t[892], t[891], t[890], t[889], t[852], t[851], t[850], t[849]}), .y({t[369], t[368], t[367], t[366], t[364], t[363], t[362], t[361], t[359], t[358], t[357], t[356], t[354], t[353], t[352], t[351], t[349], t[348], t[347], t[346], t[344], t[343], t[342], t[341], t[339], t[338], t[337], t[336], t[334], t[333], t[332], t[331], t[329], t[328], t[327], t[326], t[324], t[323], t[322], t[321], t[319], t[318], t[317], t[316], t[314], t[313], t[312], t[311], t[309], t[308], t[307], t[306], t[304], t[303], t[302], t[301], t[299], t[298], t[297], t[296], t[294], t[293], t[292], t[291], t[289], t[288], t[287], t[286], t[284], t[283], t[282], t[281], t[279], t[278], t[277], t[276], t[274], t[273], t[272], t[271], t[269], t[268], t[267], t[266], t[264], t[263], t[262], t[261], t[259], t[258], t[257], t[256], t[254], t[253], t[252], t[251], t[249], t[248], t[247], t[246], t[244], t[243], t[242], t[241], t[239], t[238], t[237], t[236], t[234], t[233], t[232], t[231], t[229], t[228], t[227], t[226], t[224], t[223], t[222], t[221], t[219], t[218], t[217], t[216], t[214], t[213], t[212], t[211], t[209], t[208], t[207], t[206], t[204], t[203], t[202], t[201], t[199], t[198], t[197], t[196], t[194], t[193], t[192], t[191], t[189], t[188], t[187], t[186], t[184], t[183], t[182], t[181], t[179], t[178], t[177], t[176], t[174], t[173], t[172], t[171], t[169], t[168], t[167], t[166], t[164], t[163], t[162], t[161], t[159], t[158], t[157], t[156], t[154], t[153], t[152], t[151], t[149], t[148], t[147], t[146], t[144], t[143], t[142], t[141], t[139], t[138], t[137], t[136], t[134], t[133], t[132], t[131], t[129], t[128], t[127], t[126], t[124], t[123], t[122], t[121], t[119], t[118], t[117], t[116], t[114], t[113], t[112], t[111], t[109], t[108], t[107], t[106], t[104], t[103], t[102], t[101], t[99], t[98], t[97], t[96], t[94], t[93], t[92], t[91], t[89], t[88], t[87], t[86], t[84], t[83], t[82], t[81], t[79], t[78], t[77], t[76], t[74], t[73], t[72], t[71], t[69], t[68], t[67], t[66], t[64], t[63], t[62], t[61], t[59], t[58], t[57], t[56], t[54], t[53], t[52], t[51], t[49], t[48], t[47], t[46], t[44], t[43], t[42], t[41], t[39], t[38], t[37], t[36], t[34], t[33], t[32], t[31], t[29], t[28], t[27], t[26], t[24], t[23], t[22], t[21], t[19], t[18], t[17], t[16], t[14], t[13], t[12], t[11], t[9], t[8], t[7], t[6], t[4], t[3], t[2], t[1]}));
  multiplexer #(.WIDTH(65)) multiplexer_inst(.s({t[805], t[806], t[807], t[808], t[666]}), .d({t[730], t[729], t[728], t[727], t[726], t[725], t[724], t[723], t[722], t[721], t[720], t[719], t[718], t[717], t[716], t[715], t[714], t[713], t[712], t[711], t[710], t[709], t[708], t[707], t[706], t[705], t[704], t[703], t[702], t[701], t[700], t[699], t[698], t[697], t[696], t[695], t[694], t[693], t[692], t[691], t[690], t[689], t[688], t[687], t[686], t[685], t[684], t[683], t[682], t[681], t[680], t[679], t[678], t[677], t[676], t[675], t[674], t[673], t[672], t[671], t[670], t[669], t[668], t[667], t[805]}), .q({y[0], y[1], y[2], y[3], y[4], y[5], y[6], y[7], y[8], y[9], y[10], y[11], y[12], y[13], y[14], y[15], y[16], y[17], y[18], y[19], y[20], y[21], y[22], y[23], y[24], y[25], y[26], y[27], y[28], y[29], y[30], y[31], y[32], y[33], y[34], y[35], y[36], y[37], y[38], y[39], y[40], y[41], y[42], y[43], y[44], y[45], y[46], y[47], y[48], y[49], y[50], y[51], y[52], y[53], y[54], y[55], y[56], y[57], y[58], y[59], y[60], y[61], y[62], y[63], y[64]}));
endmodule

module register_stage(clk, D, Q);
  parameter WIDTH = 8;
  input clk;
  input [WIDTH-1:0] D;
  output [WIDTH-1:0] Q;

  reg [WIDTH-1:0] s_current_state;
  wire [WIDTH-1:0] s_next_state;
  assign s_next_state = D;
  always @ (posedge clk)
  begin
      s_current_state <= s_next_state;
  end
  assign Q = s_current_state;
endmodule

module multiplexer(s, d, q);
  parameter WIDTH = 8;
  input [4:0] s;
  input [WIDTH-1:0] d;
  output [WIDTH-1:0] q;

  muxtree #(.WIDTH(65)) inst_0(.s(s), .d({d[0],d[1],d[2],d[3],d[4],d[5],d[6],d[7],d[8],d[9],d[10],d[11],d[12],d[13],d[14],d[15],d[16],d[17],d[18],d[19],d[20],d[21],d[22],d[23],d[24],d[25],d[26],d[27],d[28],d[29],d[30],d[31],d[32],d[33],d[34],d[35],d[36],d[37],d[38],d[39],d[40],d[41],d[42],d[43],d[44],d[45],d[46],d[47],d[48],d[49],d[50],d[51],d[52],d[53],d[54],d[55],d[56],d[57],d[58],d[59],d[60],d[61],d[62],d[63],d[64]}), .q({q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22],q[23],q[24],q[25],q[26],q[27],q[28],q[29],q[30],q[31],q[32],q[33],q[34],q[35],q[36],q[37],q[38],q[39],q[40],q[41],q[42],q[43],q[44],q[45],q[46],q[47],q[48],q[49],q[50],q[51],q[52],q[53],q[54],q[55],q[56],q[57],q[58],q[59],q[60],q[61],q[62],q[63],q[64]}));
endmodule

module muxtree(s, d, q);
  parameter WIDTH = 8;
  input [4:0] s;
  input [WIDTH-1:0] d;
  output [WIDTH-1:0] q;

  wire [WIDTH-1:0] v0_0;
  wire [WIDTH-1:0] v0_1;
  wire [WIDTH-1:0] v1_0;
  wire [WIDTH-1:0] v1_1;
  wire [WIDTH-1:0] v1_2;
  wire [WIDTH-1:0] v1_3;
  wire [WIDTH-1:0] v2_0;
  wire [WIDTH-1:0] v2_1;
  wire [WIDTH-1:0] v2_2;
  wire [WIDTH-1:0] v2_3;
  wire [WIDTH-1:0] v2_4;
  wire [WIDTH-1:0] v2_5;
  wire [WIDTH-1:0] v2_6;
  wire [WIDTH-1:0] v2_7;
  wire [WIDTH-1:0] v3_0;
  wire [WIDTH-1:0] v3_1;
  wire [WIDTH-1:0] v3_2;
  wire [WIDTH-1:0] v3_3;
  wire [WIDTH-1:0] v3_4;
  wire [WIDTH-1:0] v3_5;
  wire [WIDTH-1:0] v3_6;
  wire [WIDTH-1:0] v3_7;
  wire [WIDTH-1:0] v3_8;
  wire [WIDTH-1:0] v3_9;
  wire [WIDTH-1:0] v3_10;
  wire [WIDTH-1:0] v3_11;
  wire [WIDTH-1:0] v3_12;
  wire [WIDTH-1:0] v3_13;
  wire [WIDTH-1:0] v3_14;
  wire [WIDTH-1:0] v3_15;

  assign q = s[0] ? v0_1 : {WIDTH{1'b0}};

  assign v0_0 = s[1] ? v1_1 : {WIDTH{1'b0}};
  assign v0_1 = s[1] ? v1_3 : {WIDTH{1'b0}};

  assign v1_0 = s[2] ? v2_1 : {WIDTH{1'b0}};
  assign v1_1 = s[2] ? v2_3 : {WIDTH{1'b0}};
  assign v1_2 = s[2] ? v2_5 : {WIDTH{1'b0}};
  assign v1_3 = s[2] ? v2_7 : {WIDTH{1'b0}};

  assign v2_0 = s[3] ? v3_1 : {WIDTH{1'b0}};
  assign v2_1 = s[3] ? v3_3 : {WIDTH{1'b0}};
  assign v2_2 = s[3] ? v3_5 : {WIDTH{1'b0}};
  assign v2_3 = s[3] ? v3_7 : {WIDTH{1'b0}};
  assign v2_4 = s[3] ? v3_9 : {WIDTH{1'b0}};
  assign v2_5 = s[3] ? v3_11 : {WIDTH{1'b0}};
  assign v2_6 = s[3] ? v3_13 : {WIDTH{1'b0}};
  assign v2_7 = s[3] ? v3_15 : {WIDTH{1'b0}};

  assign v3_0 = {WIDTH{1'b0}};
  assign v3_1 = {WIDTH{1'b0}};
  assign v3_2 = {WIDTH{1'b0}};
  assign v3_3 = {WIDTH{1'b0}};
  assign v3_4 = {WIDTH{1'b0}};
  assign v3_5 = {WIDTH{1'b0}};
  assign v3_6 = {WIDTH{1'b0}};
  assign v3_7 = {WIDTH{1'b0}};
  assign v3_8 = {WIDTH{1'b0}};
  assign v3_9 = {WIDTH{1'b0}};
  assign v3_10 = {WIDTH{1'b0}};
  assign v3_11 = {WIDTH{1'b0}};
  assign v3_12 = {WIDTH{1'b0}};
  assign v3_13 = {WIDTH{1'b0}};
  assign v3_14 = {WIDTH{1'b0}};
  assign v3_15 = s[4] ? d : {WIDTH{1'b0}};

endmodule

