event_inherited();

// 5) 행렬 출력
PrintMatrix(matrixGrid);

// 6) BFS 검사
var res = BFSRegion(matrixGrid);
var ok  = res[? "success"];            // 올바른 맵 조회 문법
var clist  = res[? "coords"];

// 7) 결과 로그
if (ok) {
    show_debug_message("영역이 완전히 둘러싸여 있습니다!");
} else {
    show_debug_message("영역이 경계에 닿아서 실패했습니다!");
}

/*
for (var i = 0; i < ds_list_size(clist); i++) {
    var p = clist[| i]; // [x,y]
    show_debug_message("Cell: (" + string(p[0]) + "," + string(p[1]) + ")");
}
*/

for (var s = 0; s < EnemySpotNum; s++) {
    var idx  = irandom(ds_list_size(clist) - 1);
    var base = clist[| idx];    // [tx,ty]
    ds_list_delete(clist, idx);

    var region = BFS_Grid(base[0], base[1], EnemySpotEnemyNum);
    for (var j = 0; j < ds_list_size(region); j++) {
        var c = region[| j];
        PlaceTargetEnemyAt(c[0], c[1]);
    }
    ds_list_destroy(region);
}


// 8) 메모리 정리
ds_list_destroy(clist);
ds_map_destroy(res);
