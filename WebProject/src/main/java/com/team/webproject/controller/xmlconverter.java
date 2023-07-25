package com.team.webproject.controller;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class xmlconverter {
//	// tag값의 정보를 가져오는 메소드
//		private static String getTagValue(String tag, Element eElement) {
//		    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
//		    Node nValue = (Node) nlList.item(0);
//		    if(nValue == null) 
//		        return null;
//		    return nValue.getNodeValue();
//		}
//	DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
//  DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
//  InputStream is = new ByteArrayInputStream(resultMap.getBody().getBytes());
//  
//  Document doc = dBuilder.parse(is);
//  
//  NodeList nListcode = doc.getElementsByTagName("mt20id");
//  NodeList nListname = doc.getElementsByTagName("prfnm");
//  NodeList nListfrom = doc.getElementsByTagName("prfpdfrom");
//  NodeList nListto = doc.getElementsByTagName("prfpdto");
//  NodeList nListplace = doc.getElementsByTagName("fcltynm");
//  NodeList nListposter = doc.getElementsByTagName("poster");
//  NodeList nListcategory = doc.getElementsByTagName("genrenm");
//  NodeList nListstate = doc.getElementsByTagName("prfstate");
//  NodeList nListopenrun = doc.getElementsByTagName("openrun");
//  System.out.println("node:"+nListcode.getLength());
//  
//  Map<String, NodeList> nodeList = new HashMap<>();
//  nodeList.put("code", nListcode);
//  nodeList.put("name", nListname);
//  nodeList.put("from", nListfrom);
//  nodeList.put("to", nListto);
//  nodeList.put("place", nListplace);
//  nodeList.put("poster", nListposter);
//  nodeList.put("category", nListcategory);
//  nodeList.put("state", nListstate);
//  nodeList.put("openrun", nListopenrun);
//  
//  JSONObject xmltojson = new JSONObject();
// 
//  for(String key: nodeList.keySet()) {
//  	JSONArray testarr = new JSONArray();
//		 for(int temp = 0; temp < nListcode.getLength(); temp++){
//  		Node item = nodeList.get(key).item(temp);
//      	Node text = item.getFirstChild();
//          String itemcode = text.getNodeValue();
//          testarr.add(itemcode);
//  	}
//		model.addAttribute(key, testarr);
//		
//  	xmltojson.put(key, testarr);
//  }
//  System.out.println(xmltojson.toJSONString());
}
