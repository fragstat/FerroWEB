package app.model;

import java.util.HashMap;

public class Text {
    private static  final Text instance = new Text();

    private final HashMap<String, String> text;

    private Text(){
        text = new HashMap<>();
    }

    public static Text getInstance(){return instance;}

    public void addText(String UserName,String UserText){
        text.put(UserName,UserText);
    }

    public void deleteText(String UserName){
        text.remove(UserName);
    }

    public String getText(String UserName){
        return text.get(UserName);
    }
}
