 // 1) Col 레이어 타일맵 핸들
tm = layer_tilemap_get_id(layer_get_id("Col"));
if (tm == -1) {
    show_debug_message("▶ collisionMap 타일맵이 없습니다.");
    return;
}

// 2) 그리드 크기 & 타일 크기/원점
W  = tilemap_get_width(tm)
H  = tilemap_get_height(tm)
TW = tilemap_get_tile_width(tm)
TH = tilemap_get_tile_height(tm)
OX = tilemap_get_x(tm)
OY = tilemap_get_y(tm)

// 3) 이 인스턴스의 셀 좌표
obj_tx = floor((x - OX) / TW)
obj_ty = floor((y - OY) / TH)

matrixGrid = ds_grid_create(W, H);
for (var ty = 0; ty < H; ty++) {
    for (var tx = 0; tx < W; tx++) {
        var val;
        if (tx == obj_tx && ty == obj_ty) {
            val = 3;
        } else {
            var px  = OX + tx * TW + TW/2,
                py  = OY + ty * TH + TH/2,
                tid = tilemap_get_at_pixel(tm, px, py);
            val = (tid == 0 ? 0 : 1);
        }
        ds_grid_set(matrixGrid, tx, ty, val);
    }
}
