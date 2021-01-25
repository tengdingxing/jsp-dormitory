package com.msq.entity;

import lombok.Data;

@Data
public class ShowStudent extends Student{

    private String classname;

    private String majorname;

    private String roomname;

    private String bedname;

    public ShowStudent(){

    }
}
