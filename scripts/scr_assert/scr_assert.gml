/// @description 간단한 Assert 함수
/// @param cond  // 검사할 불리언 조건
/// @param msg   // 실패 시 출력할 에러 메시지
function scr_assert(cond, msg) {
    if (!cond) {
        // fatal=true 로 설정하면 즉시 실행 중단
        show_error(msg, true);
    }
}
