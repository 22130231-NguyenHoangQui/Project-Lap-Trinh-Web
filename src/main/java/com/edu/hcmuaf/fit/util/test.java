package com.edu.hcmuaf.fit.util;

import java.sql.Connection;
import java.sql.SQLException;

public class test {
    public static void main(String[] args) throws InterruptedException {
                   // Kiểm tra số lượng kết nối ban đầu
                System.out.println("Kết nối ban đầu trong pool: " + ConnectionPool.getConnectionCount());

                // Mô phỏng nhiều thread lấy kết nối
                for (int i = 0; i < 20; i++) {
                    new Thread(() -> {
                        try {
                            // Lấy kết nối
                            Connection connection = ConnectionPool.getConnection();
                            System.out.println("Kết nối " + Thread.currentThread().getId() + " đã được lấy.");

                            // Giả lập một thao tác nào đó với kết nối
                            Thread.sleep(500);  // Giả lập thời gian làm việc

                            // Trả kết nối lại
                            ConnectionPool.releaseConnection(connection);
                            System.out.println("Kết nối " + Thread.currentThread().getId() + " đã được trả lại.");
                        } catch (SQLException | InterruptedException e) {
                            e.printStackTrace();
                        }
                    }).start();
                }

                // Đợi một chút để các thread thực hiện xong
                Thread.sleep(10000);  // Đợi thêm một chút để các kết nối được xử lý

                // Kiểm tra lại số lượng kết nối trong pool sau khi thực hiện các thao tác
                System.out.println("Kết nối còn lại trong pool: " + ConnectionPool.getConnectionCount());
            }
        }
