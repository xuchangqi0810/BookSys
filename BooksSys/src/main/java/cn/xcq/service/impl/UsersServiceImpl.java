package cn.xcq.service.impl;

import cn.xcq.dao.IUsersDAO;
import cn.xcq.entity.Book_Info;
import cn.xcq.entity.Book_Type;
import cn.xcq.entity.Page;
import cn.xcq.entity.Users;
import cn.xcq.service.IUsersService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/31
 * Time:14:03
 */
@Service("usersService")
public class UsersServiceImpl implements IUsersService {
    @Resource(name = "IUsersDAO")
    private IUsersDAO usersDAO;

    @Override
    public Users login(String usercode, String password) {
        return usersDAO.login(usercode,password);
    }

    @Override
    public int registerUser(Users users) {
        return usersDAO.registerUser(users);
    }

    @Override
    public List<Book_Type> getBook_Type() {
        return usersDAO.getBook_Type();
    }

    @Override
    public Page<Book_Info> getAllBook(Integer typeId, String bookName, Integer is_borrow, Integer pageIndex, Integer pageSize) {
        Page<Book_Info> page=new Page<Book_Info>();
        Map<String,Object> map=new HashMap<>();
        map.put("typeId",typeId);
        map.put("bookName",bookName);
        map.put("is_borrow",is_borrow);
        map.put("pageIndex",pageIndex);
        map.put("pageSize",pageSize);
        List<Book_Info> allBook = usersDAO.getAllBook(map);
        page.setLists(allBook);
        page.setPageIndex(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalSize(getCount(map));
        return page;
    }

    @Override
    public int getCount(Map<String,Object> map) {
        return usersDAO.getCount(map);
    }


    public IUsersDAO getUsersDAO() {
        return usersDAO;
    }

    public void setUsersDAO(IUsersDAO usersDAO) {
        this.usersDAO = usersDAO;
    }
}
