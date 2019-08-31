package com.engbaek.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.AdminVO;
import com.engbaek.domain.StudentVO;
import com.engbaek.domain.TeacherVO;
import com.engbaek.mapper.InfoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InfoServiceImpl implements InfoService {
   @Setter(onMethod_ = @Autowired)
   private InfoMapper mapper;
   
   @Override
   public StudentVO getS(String studentId) {
      log.info("getInfoStudent");
      return mapper.getInfoStudent(studentId);
   }

   @Override
   public TeacherVO getT(String teacherId) {
      log.info("getInfoTeacher");
      return mapper.getInfoTeacher(teacherId);
   }

   @Override
   public AdminVO getA(String adminId) {
      log.info("getInfoAdmin");
      return mapper.getInfoAdmin(adminId);
   }

   @Override
   public boolean deleteStudent(String studentId) {
      log.info("deleteStudent");
      return mapper.deleteStudent(studentId) == 1;
   }

   @Override
   public boolean updateInfoStudent(StudentVO vo) {
      log.info("updateInfoStudent");
      return mapper.updateInfoStudent(vo) == 1;
   }

   @Override
   public boolean updateInfoTeacher(TeacherVO vo) {
      log.info("updateInfoTeacher");
      return mapper.updateInfoTeacher(vo) == 1;
   }

   @Override
   public boolean updateInfoAdmin(AdminVO vo) {
      log.info("updateInfoAdmin");
      return mapper.updateInfoAdmin(vo) == 1;
   }

}