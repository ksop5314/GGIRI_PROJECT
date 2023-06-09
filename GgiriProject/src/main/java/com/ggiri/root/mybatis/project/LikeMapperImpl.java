package com.ggiri.root.mybatis.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeMapperImpl implements LikeMapper {

    private static final String DB_URL = "jdbc:oracle:thin:@labong_medium?TNS_ADMIN=/Users/jangeunsu/GODLIFE/sundry/wallet/Wallet_labong";
    private static final String DB_USER = "labong";
    private static final String DB_PASSWORD = "dmstn101010";

    @Override
    public void insertLike(int projectNum, String user_no) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                PreparedStatement statement = connection.prepareStatement(
                        "INSERT INTO likes (project_num, user_no) VALUES (?, ?)")) {
            statement.setInt(1, projectNum);
            statement.setString(2, user_no);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteLike(int projectNum, String user_no) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                PreparedStatement statement = connection.prepareStatement(
                        "DELETE FROM likes WHERE project_num = ? AND user_no = ?")) {
            statement.setInt(1, projectNum);
            statement.setString(2, user_no);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void saveHeart(String projectNum, String userid) {
        insertLike(Integer.parseInt(projectNum), userid);
    }

    @Override
    public boolean isLiked(String projectNum, String userid) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                PreparedStatement statement = connection.prepareStatement(
                        "SELECT COUNT(*) FROM likes WHERE project_num = ? AND user_no = ?")) {
            statement.setInt(1, Integer.parseInt(projectNum));
            statement.setString(2, userid);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void removeHeart(String projectNum, String userid) {
        deleteLike(Integer.parseInt(projectNum), userid);
    }

    @Override
    public int getLikeCount(String projectNum) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                PreparedStatement statement = connection.prepareStatement(
                        "SELECT COUNT(*) FROM likes WHERE project_num = ?")) {
            statement.setInt(1, Integer.parseInt(projectNum));
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
