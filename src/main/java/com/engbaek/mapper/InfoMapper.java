package com.engbaek.mapper;

import com.engbaek.domain.AdminVO;
import com.engbaek.domain.StudentVO;
import com.engbaek.domain.TeacherVO;

public interface InfoMapper {

   public StudentVO getInfoStudent(String studentId);
      
   public TeacherVO getInfoTeacher(String teacherId);
   
   public AdminVO getInfoAdmin(String adminId);
   
   public int deleteStudent(String studentId);
   
   public int updateInfoStudent(StudentVO vo);
   
   public int updateInfoTeacher(TeacherVO vo);
   
   public int updateInfoAdmin(AdminVO vo);
}