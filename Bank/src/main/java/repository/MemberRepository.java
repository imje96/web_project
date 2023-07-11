package repository;

import vo.MemberDTO;

public interface MemberRepository {
    String findMemberIdByPersonalIdNumber(String personalIdNumber);

    // 회원가입 시 중복 아이디 검사
    public boolean checkId(String uId);
    
    // 카카오 최초 로그인 메소드
    public void insertKaKaoMember(String id, String nickName, String email);
    
    //카카오 로그인한 사람의 Dto 가져오기
    public MemberDTO memberLoginCheck(String kakaoId);
    
    //카카오 최초 로그인한 사람 추가 정보 입력
    public void kakaoJoin(String id, String simplePw, String phone, String personID, String gender, String birth, String zipcode, String address, String detailAddress);
    
    //메일보내기 
    //public String mailSend(String email);
        
    // 회원가입시 주민등록번호 중복 체크
    public boolean personIdCheck(MemberDTO dto);
    
    //회원가입
    public void joinMember(MemberDTO dto);
    
    //일반 로그인 
    public MemberDTO memberLoginCheck(String ckId, String ckPw);
    
}
