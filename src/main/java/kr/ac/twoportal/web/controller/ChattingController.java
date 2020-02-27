package kr.ac.twoportal.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChattingController {

	@GetMapping("/clientAccessChat.hta")
	public String clientAccessChat() {
		return "share/clientChatting";
	}
	@GetMapping("/serverChat.hta")
	public String serverAccessChat() {
		return "share/serverChatting";
	}
}
