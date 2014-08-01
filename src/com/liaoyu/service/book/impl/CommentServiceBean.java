package com.liaoyu.service.book.impl;

import org.springframework.stereotype.Service;

import com.liaoyu.bean.book.Comment;
import com.liaoyu.service.DaoSupport;
import com.liaoyu.service.book.CommentService;

@Service
public class CommentServiceBean extends DaoSupport<Comment> implements CommentService {

}
