package com.pzh.info.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.info.domain.Firm;
import com.pzh.info.service.impl.FirmServiceImpl;
import com.pzh.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/firm")
public class FirmController {
    @Autowired
    private FirmServiceImpl firmServiceImpl;

    //------------------查询-----------------------
    /**
     * 根据条件查询公司
     * 没有条件返回所有公司
     * @param firm 查询条件
     * @return 指定公司
     */
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getUserByCondition(@RequestBody Firm firm) {
        LambdaQueryWrapper<Firm> firmLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据公司编号查
        firmLambdaQueryWrapper.eq((firm.getId()!=null) && (firm.getId()>=0),
                                            Firm::getId, firm.getId());
        // 根据公司名称查
        firmLambdaQueryWrapper.eq((firm.getName()!=null) && (!firm.getName().equals("")),
                                            Firm::getName, firm.getName());
        // 根据公司负责人查
        firmLambdaQueryWrapper.eq((firm.getLeader()!=null) && (!firm.getLeader().equals("")),
                                            Firm::getLeader, firm.getLeader());
        // 根据电话查
        firmLambdaQueryWrapper.eq((firm.getPhone()!=null) && (!firm.getPhone().equals("")),
                                            Firm::getPhone, firm.getPhone());
        return new R(true, firmServiceImpl.list(firmLambdaQueryWrapper));
    }


    //------------------添加-----------------------
    /**
     * 根据用户填写公司信息添加公司
     * @param firm 公司信息
     * @return 是否添加
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addUser(@RequestBody Firm firm) {
        return new R(true, firmServiceImpl.save(firm));
    }


    //------------------更新-----------------------
    /**
     * 根据用户输入进行公司信息修改
     * @param firm 用户输入信息
     * @return 是否修改成功
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateUser(@RequestBody Firm firm) {
        return new R(true, firmServiceImpl.updateById(firm));
    }

    //------------------删除--------------------
//    /**
//     * 根据ID删除公司
//     * @param id 送死编号
//     * @return 是否删除成功
//     */
//    @RequestMapping(value = "/delete")
//    public R deleteUserByID(Integer id) {
//        return new R(true, firmServiceImpl.removeById(id));
//    }
}
