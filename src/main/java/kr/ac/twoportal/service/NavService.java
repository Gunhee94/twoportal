package kr.ac.twoportal.service;

import java.util.List;

import kr.ac.twoportal.dto.NavLeftDto;

public interface NavService {
	List<NavLeftDto> getNavLeftsByJob(String job);
}
