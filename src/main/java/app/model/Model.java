package app.model;

import app.entities.User;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import java.util.*;
import java.util.stream.Collectors;

public class Model {
    private static final Model instance = new Model();

    private final List<User> model;

    public static Model getInstance() {
        return instance;
    }

    private Model() {
        model = new ArrayList<>();
    }

    public void add(User user) {
        model.add(user);
    }

    public void delete(User user) {
        model.remove(user);
    }

    public List<String> list() {
        return model.stream()
                .map(User::getName)
                .collect(Collectors.toList());
    }

    public Map<String, String> map() {
        return model.stream()
                .collect(Collectors.toMap(User::getName,User::getPassword));
    }

}
