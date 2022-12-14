package com.iu.home.party;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.iu.home.member.MemberDTO;
import com.iu.home.util.Pager;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "/party/*")
public class PartyController {
	
	@Autowired
	private PartyService partyService;
	
	// PartyList===============================================================================
	
	@PostMapping(value = "update")
	public String setPartyUpdate(PartyListDTO partyListDTO)throws Exception{
		int result = partyService.setPartyUpdate(partyListDTO);
		return "redirect:./detail?partyNum"+partyListDTO.getPartyNum();
	}
	
	@GetMapping(value = "update")
	public ModelAndView setPartyUpdate(PartyListDTO partyListDTO, ModelAndView mv, HttpSession session)throws Exception{
		partyListDTO = partyService.getPartyDetail(partyListDTO);
		mv.addObject("member", (MemberDTO)session.getAttribute("member"));
		mv.addObject("partyListDTO", partyListDTO);
		mv.setViewName("party/update");
		return mv;
	}
	
	@PostMapping(value = "delete")
	@ResponseBody
	public ModelAndView setPartyDelete(PartyListDTO partyListDTO, ModelAndView mv)throws Exception{
		int result = partyService.setPartyDelete(partyListDTO);
		String jsonResult="{\"result\":\""+result+"\"}";
		mv.addObject("result", jsonResult);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping(value="list")
	public ModelAndView getPartyList(Pager pager, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PartyListDTO> ar = partyService.getPartyList(pager);
		mv.addObject("member", (MemberDTO)session.getAttribute("member"));

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("party/list");
		return mv;
	}
	
	@GetMapping(value = "detail")
	public ModelAndView getPartyDetail(PartyListDTO partyListDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		partyListDTO = partyService.getPartyDetail(partyListDTO);
		mv.addObject("member", (MemberDTO)session.getAttribute("member"));
		mv.addObject("partyListDTO", partyListDTO);
		mv.setViewName("party/detail");
		
		return mv;
	}
	
	@GetMapping(value = "add")
	public String setPartyAdd(PartyListDTO partyListDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();

		mv.addObject("partyListDTO", partyListDTO);
		mv.addObject("member", session.getAttribute("member"));
		return "party/add";
	}
	
	@PostMapping(value = "add")
	public ModelAndView setPartyAdd(PartyListDTO partyListDTO, MultipartFile [] files, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(partyListDTO.getPartyTimeout());
		System.out.println(partyListDTO.getPartymm());
		System.out.println(partyListDTO.getPartyHH());
		int result = partyService.setPartyAdd(partyListDTO, files, session.getServletContext());
		mv.setViewName("redirect:./list?shopNum="+partyListDTO.getShopNum());
		return mv;
	}
	
	//Party========================================================
	
	@PostMapping(value = "partyJoin")
	@ResponseBody
	public ModelAndView setPartyJoin(PartyDTO partyDTO)throws Exception{
		ModelAndView mv = new ModelAndView();

		int result = partyService.setPartyJoin(partyDTO);
		String jsonResult="{\"result\":\""+result+"\"}";
		mv.addObject("result", jsonResult);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping(value = "partyRequest")
	@ResponseBody
	public List<PartyDTO> getPartyReqeust(PartyDTO partyDTO)throws Exception{
		List<PartyDTO> ar = partyService.getPartyRequest(partyDTO);
		return ar;
	}
	
	@PostMapping(value = "partyCancel")
	public ModelAndView setPartyCancel(PartyDTO partyDTO, String[] userName)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = partyService.setPartyCancel(partyDTO, userName);
		String jsonResult="{\"result\":\""+result+"\"}";
		mv.addObject("result", jsonResult);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping(value = "partyAccept")
	public ModelAndView setPartyAccept(PartyDTO partyDTO, String [] userName)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = partyService.setPartyAccept(partyDTO, userName);
		String jsonResult="{\"result\":\""+result+"\"}";
		mv.addObject("result", jsonResult);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
}
