function PlaceTargetEnemyAt(tx, ty) {
    // 셀의 왼쪽 위 픽셀 좌표
    var x0 = OX + tx * TW;
    var y0 = OY + ty * TH;

    // 셀 너비·높이만큼 0–tileW, 0–tileH 사이에서 랜덤 오프셋
    var px = x0 + random(TW);
    var py = y0 + random(TH);

    // 랜덤 위치에 몬스터 생성
    instance_create_layer(px, py, "Instances", TargetEnemy);
}
