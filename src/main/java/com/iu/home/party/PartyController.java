package com.iu.home.party;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.home.util.Pager;

@Controller
@RequestMapping(value = "/party/*")
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	
	// PartyList===============================================================================
	@GetMapping(value="list")
	public ModelAndView getPartyList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<PartyListDTO> ar = partyService.getPartyList(pager);
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("party/list");
		return mv;
	}
	
	@GetMapping(value = "detail")
	public ModelAndView getPartyDetail(PartyListDTO partyListDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		partyListDTO = partyService.getPartyDetail(partyListDTO);
		
		mv.addObject("partyListDTO", partyListDTO);
		mv.setViewName("party/detail");
		
		return mv;
	}
	
	@GetMapping(value = "add")
	public String setPartyAdd(PartyListDTO partyListDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("partyListDTO", partyListDTO);
		return "party/add";
	}
	
	@PostMapping(value = "add")
	public ModelAndView setPartyAdd(PartyListDTO partyListDTO, MultipartFile [] files, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(partyListDTO.getShopNum());
		int result = partyService.setPartyAdd(partyListDTO, files, session.getServletContext());
		mv.setViewName("redirect:./list");
		return mv;
	}
}
