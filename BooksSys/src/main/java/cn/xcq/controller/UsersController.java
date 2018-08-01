package cn.xcq.controller;

import cn.xcq.entity.Book_Info;
import cn.xcq.entity.Book_Type;
import cn.xcq.entity.Page;
import cn.xcq.entity.Users;
import cn.xcq.service.IUsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/31
 * Time:14:04
 */
@Controller
public class UsersController {
    //注入Service
    @Resource(name = "usersService")
    private IUsersService usersService;

    //01.登录
    @RequestMapping("/login")
    public ModelAndView login(String usercode, String password, HttpSession session){
        ModelAndView mv=new ModelAndView();
        Users login = usersService.login(usercode, password);
        if(login!=null){
            //查询所有分类
            List<Book_Type> book_type = usersService.getBook_Type();
            session.setAttribute("booktype",book_type);
            session.setAttribute("user",login);
            mv.setViewName("index");
        }else{
            mv.setViewName("welcome");
            mv.addObject("massage","用户名或密码错误！");
        }

        return mv;
    }


    //注册
    @RequestMapping("/register")
    @ResponseBody
    public Object register(Users users){
        users.setRegister_time(new Date());
        users.setLast_logintime(new Date());
        int i = usersService.registerUser(users);

        return "ok";
    }

    //查询
    @RequestMapping("getBookAllJSON")
    @ResponseBody
    public Object getBookAllJSON(String typeId, String bookName, String is_borrow, @RequestParam(defaultValue = "1")Integer pageIndex,@RequestParam(defaultValue = "2")Integer pageSize){
        Page<Book_Info> allBook = usersService.getAllBook(Integer.parseInt(typeId), bookName, Integer.parseInt(is_borrow), pageIndex, pageSize);

        return allBook;
    }


    //退出
    @RequestMapping("loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("user");
        return "welcome";
    }

    public IUsersService getUsersService() {
        return usersService;
    }

    public void setUsersService(IUsersService usersService) {
        this.usersService = usersService;
    }
}
