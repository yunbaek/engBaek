package com.engbaek.service;

import com.engbaek.domain.AdminVO;
import com.engbaek.domain.StudentVO;
import com.engbaek.domain.TeacherVO;

public interface InfoService {
   public StudentVO getS(String studentId);
   
   public TeacherVO getT(String teacherId);
   
   public AdminVO getA(String adminId);
   
   public boolean deleteStudent(String studentId);
   
   public boolean updateInfoStudent(StudentVO vo);
   
   public boolean updateInfoTeacher(TeacherVO vo);
   
   public boolean updateInfoAdmin(AdminVO vo);
}