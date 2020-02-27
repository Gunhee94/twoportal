package kr.ac.twoportal.web.advice;

import java.io.IOException;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.ac.twoportal.service.DayCheckService;

public class DayCheckSocketAdvice extends TextWebSocketHandler {

	@Autowired
	private DayCheckService dayCheckService;

	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

	/*
	 * @Scheduled(fixedDelay = 1000) public void sendTest(HttpSession session) {
	 * 
	 * WebSocketSession savedSession = iterator.next(); try {
	 * savedSession.getAttributes();
	 * dayCheckService.getDayCheckedStudents(session.getAttribute("lectureNo"));
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * savedSession.sendMessage(new TextMessage("테스트입니다")); } catch (IOException e)
	 * { iterator.remove(); }
	 * 
	 * 
	 * }
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		System.out.println(session + "연결되었습니다");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		sessions.remove(session);
	}

}
