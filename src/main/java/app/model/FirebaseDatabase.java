package app.model;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import com.sun.javafx.collections.MappingChange;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

public class FirebaseDatabase {
    private static final FirebaseDatabase instance = new FirebaseDatabase();

    int Times = 0;

    private Firestore connect() throws IOException {
        try {
            if (Times == 0) {
                InputStream serviceAccount = new FileInputStream("D:\\Idea\\WEBapp\\src\\main\\webapp\\sergey-s-server-firebase-adminsdk-9tlec-374233c49f.json");
                GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
                FirebaseOptions options = new FirebaseOptions.Builder()
                        .setCredentials(credentials)
                        .build();
                FirebaseApp.initializeApp(options);
                Times = 1;
            }
            return FirestoreClient.getFirestore();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static FirebaseDatabase getInstance() {
        return instance;
    }

    public Map<String, Object> getTitleAsMap(String identifier) throws Exception {
        Firestore db = connect();
        if (db != null){
            DocumentReference docRef = db.collection("users").document(identifier);
            ApiFuture<DocumentSnapshot> future = docRef.get();
            DocumentSnapshot document = future.get();


            return (document.exists()) ? document.getData() : null ;
        }else {
            return null;
        }

    }

    public Map<String, Object> getTextAsMap(String title,String name) throws Exception {
        Firestore db = connect();
        DocumentReference docRef = db.collection("texts").document(name + "+" + title);
        ApiFuture<DocumentSnapshot> future = docRef.get();
        DocumentSnapshot document = future.get();

        return (document.exists()) ? document.getData() : null ;
    }

    public void writeText(String title, String name, String text) throws IOException {
        Firestore db = connect();
        Map<String, String> textMap = new HashMap<>();
        Map<String, String> userMap = new HashMap<>();
        textMap.put("text", text);
        userMap.put("title", title);
        ApiFuture<WriteResult> future = db.collection("texts").document(name + "+" + title).set(textMap);
        ApiFuture<WriteResult> write = db.collection("users").document(name).set(userMap);
    }

    public void register(String userName) throws IOException {
        String title = "Документ пользователя " + userName;
        Firestore db = connect();
        Map<String, String> userMap = new HashMap<>();
        userMap.put("title", title);
        Map<String, String> noteMap = new HashMap<>();
        noteMap.put("text", "");
        ApiFuture<WriteResult> future = db.collection("texts").document(userName + "+" + title).set(noteMap);
        ApiFuture<WriteResult> write = db.collection("users").document(userName).set(userMap);

    }

}



