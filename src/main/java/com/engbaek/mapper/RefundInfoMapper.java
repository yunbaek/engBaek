package com.engbaek.mapper;



import com.engbaek.domain.RefundInfoVO;

public interface RefundInfoMapper {
	
	//환불 규정  수정 
	public int update(RefundInfoVO  refundinfo);
	
	//환불 규정  읽기 
	public RefundInfoVO read(long bno);
	
	//환불 규정 등록 (게시물 번호 보이게)
	public Integer insertSelectKey(RefundInfoVO refundinfo);
}
