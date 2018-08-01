package cn.xcq.service;


import cn.xcq.entity.Book_Info;
import cn.xcq.entity.Book_Type;
import cn.xcq.entity.Page;
import cn.xcq.entity.Users;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/10
 * Time:13:55
 */
public interface IUsersService {
    //01.登录
    public Users login(String usercode, String password);
    //02.注册
    public int registerUser(Users users);
    //03.查询所有图书分类
    public List<Book_Type> getBook_Type();
    //查询所有数据带条件+分页
    public Page<Book_Info> getAllBook(Integer typeId, String bookName, Integer is_borrow, Integer pageIndex, Integer pageSize);

    //查询所有数据
    public int getCount(Map<String,Object> map);



}
