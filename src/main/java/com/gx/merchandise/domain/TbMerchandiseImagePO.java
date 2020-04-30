package com.gx.merchandise.domain;

import java.io.Serializable;

public class TbMerchandiseImagePO implements Serializable {
    private String imgId;
    private String merchandiseCode;
    private String imagePath;
    private String type;
    private String idx;

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public String getMerchandiseCode() {
        return merchandiseCode;
    }

    public void setMerchandiseCode(String merchandiseCode) {
        this.merchandiseCode = merchandiseCode;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    @Override
    public String toString() {
        return "TbMerchandiseImagePO{" +
                "imgId='" + imgId + '\'' +
                ", merchandiseCode='" + merchandiseCode + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", type='" + type + '\'' +
                ", idx='" + idx + '\'' +
                '}';
    }
}
