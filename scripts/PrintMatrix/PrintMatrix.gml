/// @func PrintMatrix(grid)
/// @arg grid — ds_grid 형태의 행렬
/// @desc  행렬의 각 행을 show_debug_message로 출력
function PrintMatrix(grid) {
    var W = ds_grid_width(grid);
    var H = ds_grid_height(grid);
    show_debug_message("=== PrintMatrix ("+string(W)+"×"+string(H)+") ===");
    for (var y_= 0; y_ <  H; y_++) {
        var row = "";
        for (var x_ = 0; x_ < W; x_++) {
            row += string(ds_grid_get(grid, x_, y_));
            if (x_ < W-1) row += " ";
        }
        show_debug_message(row);
    }
    show_debug_message("=== End ===");
}
