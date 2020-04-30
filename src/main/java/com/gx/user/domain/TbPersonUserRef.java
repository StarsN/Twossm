package com.gx.user.domain;

public class TbPersonUserRef {
    private String refId;
    private String personId;
    private String userId;

    public String getRefId() {
        return refId;
    }

    public void setRefId(String refId) {
        this.refId = refId;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "TbPersonUserRef{" +
                "refId='" + refId + '\'' +
                ", personId='" + personId + '\'' +
                ", userId='" + userId + '\'' +
                '}';
    }
}
