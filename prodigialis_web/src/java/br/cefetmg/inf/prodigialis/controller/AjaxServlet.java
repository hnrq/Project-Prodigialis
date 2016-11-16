/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cefetmg.inf.prodigialis.controller;

import br.cefetmg.inf.prodigialis.model.dao.impl.ProcessoSeletivoDAO;
import br.cefetmg.inf.prodigialis.model.domain.ProcessoSeletivo;
import br.cefetmg.inf.prodigialis.util.db.exception.PersistenciaException;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cliente
 */
public class AjaxServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String acao = request.getParameter("acao");
        
        if(acao.equals("dadosProcesso")){
            int  id = Integer.parseInt(request.getParameter("id"));
            if(id != 0){
                ProcessoSeletivoDAO dao = new ProcessoSeletivoDAO();
                try {
                    ProcessoSeletivo proc = dao.consultarPorId(id);
                    ArrayList<String> lista = new ArrayList<String>();
                    lista.add(proc.getCodProcesso().toString());
                    lista.add(proc.getCargoOferecido().getNom_cargo());
                    lista.add(proc.getNroVagas().toString());
                    lista.add(proc.getDataInicio().toString());
                    lista.add(proc.getDataFinal().toString());
                    String json = new Gson().toJson(lista);
                    
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                    
                    
                } catch (PersistenciaException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code."

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}