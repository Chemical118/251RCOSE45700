/// @func PlaceTargetEnemyAt(tx, ty)
/// @arg tx, ty       — 그리드 셀 좌표
function PlaceTargetEnemyAt(tx, ty) {
    // 셀의 왼쪽 위 픽셀 좌표 계산
    var x0 = OX + tx * TW;
    var y0 = OY + ty * TH;

    // 0–TW, 0–TH 사이 랜덤 오프셋
    var px = x0 + random(TW);
    var py = y0 + random(TH);

    // 몬스터 인스턴스 생성
    var inst = instance_create_layer(px, py, "Instances", TargetEnemy);

    // IsFixFrame이 TRUE일 때만 프레임 고정
    if (IsFixFrame) {
        // 애니메이션 정지
        inst.image_speed = 0;
        // 원하는 프레임 설정
        inst.image_index = irandom_range(FixFrameStart, FixFrameEnd);
    }
}
