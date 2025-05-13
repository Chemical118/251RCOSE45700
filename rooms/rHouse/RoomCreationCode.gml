/// @description “Col” 레이어 전체에 대해 충돌 타일 영역만 +/– ASCII 맵으로 출력
/// collisionMap 은 미리 layer_tilemap_get_id(layer_get_id("Col")) 로 설정했다고 가정
var tm = layer_tilemap_get_id(layer_get_id("Col"));; 
if (tm == -1) {
    show_debug_message("▶ collisionMap 타일맵이 없습니다.");
    exit;
}

// 1) 그리드 크기 체크
var W = tilemap_get_width(tm);
var H = tilemap_get_height(tm);
if (W <= 0 || H <= 0) {
    show_debug_message("▶ 타일맵 크기가 비정상입니다: " + string(W) + "×" + string(H));
    exit;
}

// 2) 한 타일 크기와 origin
var TW = tilemap_get_tile_width(tm);
var TH = tilemap_get_tile_height(tm);
var OX = tilemap_get_x(tm);
var OY = tilemap_get_y(tm);

// 3) ASCII 맵 덤프
show_debug_message("=== Collision ASCII Map ("+string(W)+"×"+string(H)+") ===");
for (var ty = 0; ty < H; ty++) {
    var row = "";
    for (var tx = 0; tx < W; tx++) {
        // 각 셀의 중앙 픽셀 좌표
        var px = OX + tx * TW + TW * 0.5;
        var py = OY + ty * TH + TH * 0.5;
        // 이 위치에 타일이 있으면 +, 없으면 –
        var tid = tilemap_get_at_pixel(tm, px, py);
        row += string(tid);
        if (tx < W-1) row += " ";
    }
    show_debug_message(row);
}
show_debug_message("=== End ===");