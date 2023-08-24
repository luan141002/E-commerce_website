CREATE TABLE `order`
(
    id                 INT          NOT NULL,
    shipInfo_id        INT          NULL,
    orderDetail_cartid INT          NULL,
    user_userID        INT          NULL,
    dateCreated        datetime     NULL,
    dateShipped        datetime     NULL,
    status             VARCHAR(255) NULL,
    CONSTRAINT pk_order PRIMARY KEY (id)
);

ALTER TABLE `order`
    ADD CONSTRAINT FK_ORDER_ON_ORDERDETAIL_CARTID FOREIGN KEY (orderDetail_cartid) REFERENCES cart (cartid);

ALTER TABLE `order`
    ADD CONSTRAINT FK_ORDER_ON_SHIPINFO FOREIGN KEY (shipInfo_id) REFERENCES shipping_info (id);

ALTER TABLE `order`
    ADD CONSTRAINT FK_ORDER_ON_USER_USERID FOREIGN KEY (user_userID) REFERENCES user (userID);