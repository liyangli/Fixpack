package com.bohui.service;

import com.bohui.resource.PropertiesResource;
import com.bohui.service.base.BaseService;

import java.io.*;

/**
 * Object desc
 * User: LiYangLi
 * Date: 13-11-8
 * Time: 上午10:21
 */
public class WinService extends BaseService {
    @Override
    public void sysConfig() {
         //java 调用cmd,传入sql文件、启动tomcat,增加驱动
    }

    private  void runCmd() throws Exception{
        String netSID = resource.getProValue("netSID");
        String userName = resource.getProValue("dbUser");
        String password = resource.getProValue("dbPassword");

        String cmdRun = "cmd /c sqlplus "+userName+"/"+password+"@"+netSID;
//        String cmdRun = "cmd /c dir";
        System.out.println(cmdRun);
        Runtime rt = Runtime.getRuntime();
        Process pr = rt.exec(cmdRun); // cmd /c calc

        BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream(), "GBK"));

        String line = null;

        while ((line = input.readLine()) != null) {
            System.out.println(line);
        }

        OutputStream out = pr.getOutputStream();
        out.write("@E:/aa.sql".getBytes());

//        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter());
//        writer.write("@E:/aa.sql");
//        writer.flush();

        int exitVal = pr.waitFor();
        System.out.println("Exited with error code " + exitVal);

        BufferedReader input1 = new BufferedReader(new InputStreamReader(pr.getInputStream(), "GBK"));

        String line1 = null;

        while ((line1 = input.readLine()) != null) {
            System.out.println(line1);
        }


    }

    private void console(){
        Console c = System.console();
        if (c == null) {
            System.err.println("No console.");
            System.exit(1);
        }

        String login = c.readLine("Enter your login: ");
        char [] oldPassword = c.readPassword("Enter your old password: ");

        char [] newPassword1 = c.readPassword("Enter your new password: ");
        char [] newPassword2 = c.readPassword("Enter new password again: ");
        System.out.println(oldPassword.toString());
        System.out.println(newPassword1.toString());
        System.out.println(newPassword2.toString());

       /* if (verify(login, oldPassword)) {
            boolean noMatch;
            do {
                char [] newPassword1 = c.readPassword("Enter your new password: ");
                char [] newPassword2 = c.readPassword("Enter new password again: ");
                noMatch = ! Arrays.equals(newPassword1, newPassword2);
                if (noMatch) {
                    c.format("Passwords don't match. Try again.%n");
                } else {
                    change(login, newPassword1);
                    c.format("Password for %s changed.%n", login);
                }
                Arrays.fill(newPassword1, ' ');
                Arrays.fill(newPassword2, ' ');
            } while (noMatch);
        }

        Arrays.fill(oldPassword, ' ');*/
    }

    private void demo() throws Exception{

        try {
            Runtime rt = Runtime.getRuntime();
            Process proc = rt.exec("cmd /c ");
            InputStream stderr = proc.getErrorStream();
            InputStreamReader isr = new InputStreamReader(stderr);

            BufferedReader br = new BufferedReader(new InputStreamReader(proc
                    .getInputStream()));

            // copy content of "path" to stdin:

            OutputStreamWriter w = new OutputStreamWriter(proc.getOutputStream());
            /*BufferedReader r = new BufferedReader(new FileReader(path));

            int ch;
            while( (ch = r.read()) != -1 ) {
                w.write(ch);
            }
            w.close();
            r.close();*/
            w.write("ls",0,2);
            w.close();

            // copy content of stdout to our stdout:
            String line = null;

            while ((line = br.readLine()) != null) {
                System.out.println(line);
            }
            br.close();

            int returnCode = proc.waitFor();

            if( returnCode != 0 ) {
                // error message
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) throws  Exception{
        WinService winService = new WinService();
//        winService.runCmd();
        //winService.console();
        winService.demo();
    }

}
