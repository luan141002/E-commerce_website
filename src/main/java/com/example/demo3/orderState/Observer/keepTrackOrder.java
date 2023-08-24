package com.example.demo3.orderState.Observer;

import com.example.demo3.business.Cart;
import com.example.demo3.business.CartItem;
import com.example.demo3.business.User;
import com.example.demo3.data.OrderDAO;
import com.example.demo3.orderState.OrderState;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.Random;

public class keepTrackOrder implements Observer{
    @Override
    public void update(OrderState state) {

    }

    @Override
    public void updateOrder(OrderState state, User user) {
        sendMail(state,user);
        System.out.println("message sent successfully"+user.getEmail());
    }
    private void sendMail(OrderState state, User user)  {
       String email = user.getEmail();

        if(email!=null || !email.equals("")) {
            // sending otp
            Random rand = new Random();
            //otpvalue = rand.nextInt(1255650);
            // Assuming you are sending email from through gmails smtp
            String host = "smtp.gmail.com";

            String to = email;// change accordingly
            // Get the session object
            Properties properties = System.getProperties();
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", "465");
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.auth", "true");
            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("phanthanhluan553@gmail.com", "djcmbbcsyrarewwo");
                }
            });
            // compose message

            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("phanthanhluan553@gmail.com"));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                /*message.setContent(link,"text/html");*/
                message.setSubject("TRACKING ON YOUR ORDER.");

                // Now set the actual message
                String text = "Chào bạn,\n" +
                        "\n" +
                        "Chúng tôi xin gửi mail này để thông báo về tình trạng đơn hàng của bạn tại cửa hàng của chúng tôi.\n" +
                        "\n" +
                        "Theo thông tin của chúng tôi, đơn hàng của bạn hiện đang trong quá trình xử lý và chuẩn bị được giao cho đơn vị vận chuyển. Để giúp bạn theo dõi tình trạng đơn hàng của mình, chúng tôi cung cấp cho bạn một số thông tin cần thiết:\n" +
                        "\n" +
                        "Mã đơn hàng:"+state.getOrder().getId()+"\n" +
                        "Số lượng: "+state.getOrder().getOrderDetail().getCount()+"\n" +
                        "Tổng giá trị đơn hàng: "+state.getOrder().getOrderDetail().getTotalCost()+"\n" +
                        "Tình trạng: "+state.getClass().getSimpleName()+"\n"+
                        "Chúng tôi sẽ tiếp tục cập nhật với bạn về tình trạng đơn hàng của bạn. Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu bổ sung nào, vui lòng liên hệ với chúng tôi qua địa chỉ email này hoặc số điện thoại của cửa hàng.\n" +
                        "\n" +
                        "Chân thành cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi. Chúc bạn một ngày vui vẻ!\n" +
                        "\n" +
                        "Trân trọng,\n" +
                        "[Tên cửa hàng của bạn]";

                String finalText ="Dear " +state.getOrder().getUser().getFirstName() +state.getOrder().getUser().getLastName() +"\n" +
                        "\n" +
                        "We are sending this email to update you on the status of your order at our store.\n" +
                        "\n" +
                        "As per our records, your order is currently being processed and is being prepared for dispatch to the delivery company. To help you track the status of your order, we provide you with the following information:\n" +
                        "\n" +
                        "Order number: "+state.getOrder().getId()+"\n" +
                        "Quantity: "+state.getOrder().getOrderDetail().getCount()+"\n" +
                        "Total order value: "+state.getOrder().getOrderDetail().getTotalCost()+"\n" +
                        "Status: "+state.getClass().getSimpleName()+"\n"+
                        "\n" +
                        "We will continue to update you on the status of your order. If you have any questions or additional requests, please contact us via this email address or the phone number of our store.\n" +
                        "\n" +
                        "Thank you for shopping at our store. Have a great day!\n" +
                        "\n" +
                        "Best regards,\n" +
                        "Luan dep trai shop";
                message.setText(finalText);

                // send message
                Transport.send(message);
                System.out.println("message sent successfully"+email);
            }
            catch (MessagingException e) {
                e.printStackTrace();
            }
        }


    }
}
