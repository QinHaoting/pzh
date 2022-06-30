package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Feedback;
import com.pzh.service.impl.FeedbackServiceImpl;
import com.pzh.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "反馈记录控制器")
@Transactional
@RestController
@RequestMapping("/feedback")
public class FeedbackController {
    @Autowired
    private FeedbackServiceImpl feedbackServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询反馈记录", notes = "根据输入条件进行反馈记录查询")
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getFeedbackByCondition(@RequestBody Feedback feedback) {
        LambdaQueryWrapper<Feedback> feedbackLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据反馈记录编号查
        feedbackLambdaQueryWrapper.eq((feedback.getId()!=null) && (feedback.getId()>=0),
                                                Feedback::getId, feedback.getId());
        // 根据反馈记录状态查
        feedbackLambdaQueryWrapper.eq((feedback.getStatus()!=null) && (feedback.getStatus()>=0),
                Feedback::getStatus, feedback.getStatus());
        return new R(true, feedbackServiceImpl.list(feedbackLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加反馈记录", notes = "根据反馈信息进行反馈记录添加")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addFeedback(@RequestBody Feedback feedback) {
        return new R(feedbackServiceImpl.save(feedback));
    }

    //------------------修改-----------------------
    @ApiOperation(value = "修改反馈记录", notes = "根据反馈记录编号ID修改反馈信息")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateFeedback(@RequestBody Feedback feedback) {
        return new R(feedbackServiceImpl.updateById(feedback));
    }
}
