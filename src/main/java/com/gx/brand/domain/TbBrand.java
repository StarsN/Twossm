package com.gx.brand.domain;

import java.io.Serializable;

public class TbBrand implements Serializable {

    private String brandId;

    private String name;

    private String code;

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "TbBrand{" +
                "brandId='" + brandId + '\'' +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                '}';
    }

}
