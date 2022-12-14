<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kdy/css/detail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

     <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c971ac6c7712b0e728a1ba2df98cf0fd"></script> -->

<style>
  #th{
    cursor: default;
  }

  #tb1{
    cursor:default;
  } 

  #dcontents{
    white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis !important;
	  max-width: 200px;
  }

  #dtitle{
    white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis !important;
	  max-width: 200px;
  }

  .search11{
    margin: 0 0 0 0;
  }
</style>
</head>
<body >
<c:import url="../../template/headerHTML.jsp"></c:import>

            <div class="d-flex" id="img1">
              <c:forEach items="${detail.shopFileDTOs}" var="shopFileDTO">               
                  <img class="flex image" style="margin-top: 25px; width: 380px; height: 380px; border-radius: 10px; box-shadow: rgba(0, 0, 0, 0.56) 0px 22px 70px 4px;" src="../../../../resources/upload/shop/${shopFileDTO.fileName}" >
              </c:forEach>
            </div>
            
            <main> 
              <div class="container" style="border-radius: 20px; margin-top: 200px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
              
                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                  <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">????????? ??????</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                        <form action="/shop/update" method="post" enctype="multipart/form-data" id="updateFrm">
                                        
                                            <div class="modal-body">
                                              <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">  
                                              <div class="mb-3">
                                                <label for="recipient-name" class="col-form-label"></label>
                                                ?????? ?????? ??????  <input type="text" class="form-control" name="shopName" value="${detail.shopName}">
                                              </div>
                                            <div class="mb-3" id="caNumBer">
                                              <label for="message-text" class="col-form-label">category</label>
                                              <select  name="categoryNum" class="form-select" id="categoryNum">
                                                <option class="categoryNums" value="1">??????</option>
                                                <option class="categoryNums" value="2">??????</option>
                                                <option class="categoryNums" value="3">??????</option>
                                                <option class="categoryNums" value="4">??????</option>
                                                <option class="categoryNums" value="5">??????</option>
                                                <option class="categoryNums" value="6">?????????</option>
                                              </select>
                                            </div> 
                                            <div class="mb-3">
                                              <label for="recipient-name" class="col-form-label"></label>
                                              ?????? ???????????? ??????  <input type="text" class="form-control" name="shopPhone" value="${detail.shopPhone}">
                                            </div>
                                          <div class="mb-3">
                                            <label for="message-text" class="col-form-label"> </label>
                                            ?????? ?????? ??????<input type="text" class="form-control"   value="${detail.shopAddress}" name="shopAddress">
                                          </div>
                                          <div class="mb-3">
                                            <label   for="recipient-name" class="col-form-label"></label>
                                            ?????? ???????????? ??????  <input type="text" class="form-control" name="priceAvg" value="${detail.priceAvg}">
                                          </div>
                                          <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            ?????? ????????? ??????  <input type="text" class="form-control" name="delivery" value="${detail.delivery}">
                                          </div>
                                          <div class="mt-3">
                                          <label for="recipient-name" class="col-form-label"></label>
                                            <textarea name = "shopContents" class="form-control mt-1" id="shopContents" rows="3">${detail.shopContents}</textarea>
                                          </div>
                                          <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            ?????? ?????? ?????? <br><textarea name="shopTitle" rows="10" cols="57">${detail.shopTitle}</textarea>
                                          </div>
                                            <c:forEach items="${detail.shopFileDTOs}" var="fileDTO">
                                              <div class="mb-3">
                                                <img class="flex image" style="width: 380px; height: 380px;" src="../../../../resources/upload/shop/${fileDTO.fileName}">
                                                <button type="button" class="fileDelete" data-file-num="${fileDTO.fileNum}" style="color: red; box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;"> Delete </button>
                                              </div>
                                            </c:forEach>
                                            <div id="addFiles">
                                              <button style="color: blue;" type="button"name="files" id="fileAdd">????????????</button>
                                            </div>
                                            <button type="button" class="btn btn-primary" id="menuAdd" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">???????????? ??????</button> 
                                              <!-- <button style="border-top: solid 1px gainsboro;"  type="button" id="shopDelete" class="btn btn-danger" onclick="location.href='/shop/delete?shopNum=${detail.getShopNum()}';">?????? ??????</button>  -->
                                          </div>
                                          <div class="modal-footer">
                                             <button type="button" style="border-top: solid 1px gainsboro;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModalDelete">?????? ??????</button> 
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">????????????</button>
                                            <button type="submit" class="btn btn-primary">????????????</button>
                                          </div>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- Modal -->
                                  <div class="modal fade" id="exampleModalDelete" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h1 class="modal-title fs-5" id="exampleModalLabel">?????? ??????</h1>
                                          <button type="button" class="btn-close"
                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                          
                                          <c:forEach items="${detail.memberDTOs}" var="memberDTO">
                                            <div>&ensp;&ensp;${memberDTO.userID}???
                                            </div>
                                            
                                            <div class="mb-3">
                                              ????????? ???????????????????????? 
                                              ?????? ????????? ????????? ??? ????????????.
                                            </div>
                                            
                                          </c:forEach> 
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">????????????</button>
                                          <button type="button" class="btn btn-primary" id="shopDelete" onclick="location.href='/shop/delete?shopNum=${detail.getShopNum()}';" >??????..</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo" id="modalOpenBtn" style="display: none;">????????? ??????</button>
                          
                            
                            <div d-flax style="padding-top: 25px;">
                              <button type="button" class="btn btn-primary" id="updateShop" data-writer="${detail.memberDTOs[0].userID}" data-user="${sessionScope.member.userID}">????????? ??????</button>
                              <button style="display: inline-block; margin:0 5px; float: right;" onclick="location='../../party/list?shopNum=${detail.shopNum}'" class="btn btn-primary">????????????</button>
                              <button  style="display: inline-block; margin:0 5px; float: right;" onclick="location='../../reviews/add?shopNum=${detail.shopNum}'" class="btn btn-primary">???????????????</button>
                            </div>
                                  <div style="border-bottom: solid 1px gainsboro; padding-bottom: 50px; padding-top: 50px;">
                                      <div class="p-2 pt-3" style="font-size: 50px;">${detail.shopName}</div>
                                        <div class="d-flex">
                                          <div >&ensp;&ensp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
                                              <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
                                              <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
                                              </svg> &ensp;${detail.hit}
                                            </div>
                                              <div>&ensp;&ensp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                                </svg> &ensp;${detail.memberDTOs[0].userID}???
                                              </div>
                                         
                                      </div>   
                                      <div>
                                        <button class="go" onclick="goBack()" style="color: black; box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;">??????????????????</button>
                                      </div>
                                  </div>
    
         <div class="Information d-flex justify-content-between" style="border-bottom: solid 1px gainsboro; padding-top: 50px; padding-bottom: 50px;">
        <div>
        <!-- <div id="map" style="width:1000px; height:1000px;"></div> -->
        <div class="flex-row">
            <div class="d-flex q" id="address">?????? &ensp;&ensp;&ensp;&ensp;&nbsp;&nbsp;&ensp;&ensp;:
               <div class="flex q" id="realAddress">&ensp;&ensp;&ensp;${detail.shopAddress}</div>
            </div>
            <div class="d-flex q" id="phone">???????????? &ensp;&ensp;&ensp;&nbsp;:
               <div class="flex q" id="realPhone">&ensp;&ensp;&ensp;${detail.shopPhone}</div>
            </div>
            <div class="d-flex q" id="priceAvg">????????? &ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;:
               <div class="flex q" id="realpriceAvg">&ensp;&ensp;&ensp;${detail.priceAvg}???</div>
            </div>
            <div class="d-flex q" id="delivery">????????? &ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;:
               <div class="flex q" id="realdelivery">&ensp;&ensp;&ensp;${detail.delivery}???</div>
            </div>

            <c:forEach items="${detail.menuDTOs}" var="menuDTO">
          <div class="d-flex q" id="menuDelete" >???????????? &ensp;&ensp;&nbsp;
            <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">
            <input type="hidden" id="menuNum" name="menuNum" value="${menuDTO.menuNum}">
                  <div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuName}</div>
                  <div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuPrice}???</div>
               </div>
          <div class="dy flex btn btn-danger" id="deleteMenu" style="box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;" onclick="location.href='/shop/deleteMenu?menuNum=${menuDTO.menuNum}&shopNum=${detail.shopNum}';">&ensp;??????????????????</div>
            </c:forEach>
      </div>
      </div>
      <div class="side-wrap" id="map2" style="width:350px;height:350px; box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;" ></div>
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header" >
                                        <h5 class="modal-title" id="exampleModalLabel" type="hidden">???????????? ??????</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                        <form action="./addMenuHTML" method="post">
                                        
                                    <div class="modal-body">
                                            <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">
                                            <input type="hidden" id="menuNum" name="menuNum" value="${detail.menuNum}">
                                            
                                        <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label"></label>
                                          <input type="text" class="form-control" id="recipient-name" placeholder="????????? ????????? ??????????????????" name="menuName">
                                        </div>
                                        
                                        <div class="mb-3">
                                          <label for="message-text" class="col-form-label"></label>
                                          <input type="text" class="form-control" id="recipient-name" placeholder="????????? ????????? ??????????????????" name="menuPrice">
                                        </div>
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" style="box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;" data-bs-dismiss="modal">????????????</button>
                                        <button type="submit" class="btn btn-primary" style="box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;" id="menuAddNum">????????????</button>
                                    </div>
                          </form>
                          </div>
                      </div>
                   </div>
  
                  </div>
                  <div style="border-bottom: solid 1px gainsboro; box-shadow: rgba(0, 0, 0, 0.45) -20px -20px -20px -20px; ">
                    <div style="font-size: 25px; text-align: center; font-weight: bold;">
                      ?????? ??????
                    </div>
                    <br>
                    <br>
                    <br>
                    <div style="font-weight: bold;">
                      ${detail.shopContents}
                    </div>
                   <br>
                    <br>
                    <br>
                 </div>
              
         </div>
        

     </div>
     <br>
     <br>
     <br>
     <!-- <form action="../../reviews/list" class="row row-cols-lg-auto g-3 align-items-center"> -->
      <section class="container" style="border-radius: 20px; margin-top: 50px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
        <div style="padding-top: 30px; font-size: 35px; text-align: center; font-weight: bold;">
          ${detail.shopName}&nbsp;&nbsp;??????
        </div>
        
        <form action="../shop/detailHTML" class="row row-cols-lg-auto g-3 align-items-center">
            <!-- <form action="../../reviews/list" class="row row-cols-lg-auto g-3 align-items-center"> -->
          <div class="container px-4 px-lg-5 my-5" style=" left: 45%;">
              <!-- div class="col-12" ???????????? ????????? div -->
            <div class="search11">

                    <div class="col-12 search11">
                      <input type="hidden" name="shopNum" value="${param.shopNum}">
                      <label class="visually-hidden" for="kind">Kind</label>
                      <select name="kind" class="form-select" id="kind">
                        <option selected>???????????????</option>
                        <option class="kinds" value="userID">?????????</option>
                        <option class="kinds" value="title">??????</option>
                        <option class="kinds" value="contents">??????</option>
                      </select>
                    </div>

                    <div class="col-12">
                      <label class="visually-hidden" for="search">???????????? ???????????????</label>
                    </div>

                    <div class="input-group search11">
                        <input type="text" name="search" value="${param.search}" class="form-control" id="search">
                    </div>   

                    <div class="col-12 search11">
                      <button type="submit" class="btn btn-primary">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                          </svg>
                            ??????
                      </button>
                    </div>
            </div>
          </div>
      </form>


          <tbody id="tb1">
                <c:forEach items="${requestScope.list}" var="dto" >
              <div class="reviews_list" onclick="location.href='../../reviews/detail?reviewNum=${pageScope.dto.reviewNum}';">
                <div class="list" >
                  <div>
                    <div class="d-flex" style="cursor: pointer;">
                      <div class="p-2 w-100" >
                        <div class="container2" style="font-size: 15px; padding: 12px; border-bottom: solid 1px gainsboro; height: 130px;" >
                          <td>?????????&nbsp;&nbsp;:&nbsp;&nbsp;${pageScope.dto.reviewNum}</td><br>
                          <td>????????? ?????????&nbsp;&nbsp;:&nbsp;&nbsp;${pageScope.dto.userID}</td><br>
                          <td id="dtitle">??????&nbsp;&nbsp;:&nbsp;&nbsp;${pageScope.dto.title}</td><br>
                          <td>????????????&nbsp;&nbsp;:&nbsp;&nbsp;${pageScope.dto.reviewDate}</td><br>
                          <td>?????????&nbsp;&nbsp;:&nbsp;&nbsp;${pageScope.dto.hits}</td><br>	
                        </div>
                      </div>
                      <div class="p-2 flex-shrink-1">
                    </div>
                    </div>
                  </div>
                </div>
              </div>
          </c:forEach>
          </tbody>
        </table>
        <div style="display: flex; margin: 55px;  justify-content: center;">
          <input name="shopNum" type="hidden" value="${detail.shopNum}">
          
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <!--?????? ??????-->
              <c:if test="${reviewsPager.pre}">
                <li class="page-item">

                  <a class="page-link" name="shopNum" href="../../shop/detailHTML?shopNum=${detail.shopNum}&page=${reviewsPager.startNum-1}&kind=${reviewsPager.kind}&search=${reviewsPager.search}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
              </c:if>
              
              <c:forEach begin="${reviewsPager.startNum}" end="${reviewsPager.lastNum}" var="i">

                    <li class="page-item"><a class="page-link" name="shopNum" href="../../shop/detailHTML?shopNum=${detail.shopNum}&page=${i}&kind=${reviewsPager.kind}&search=${reviewsPager.search}">${i}</a></li>
              </c:forEach>

              <!--?????? ??????-->
            <li class="page-item ${reviewsPager.next?'':'disabled'}">
                <a class="page-link" name="shopNum" href="../../shop/detailHTML?shopNum=${detail.shopNum}&page=${reviewsPager.lastNum+1}&kind=${reviewsPager.kind}&search=${reviewsPager.search}" aria-label="Next">

                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
    </section>


     <button class="go" onclick="window.location.href='#top'" style="margin-top: 50px; color: black; box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;">????????????</button>


</main>
    
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="../../../../resources/kdy/js/detailHTML.js"></script>
<script type="text/javascript">

    $("#shopContents").summernote(
            {
                    height: 260,                
                    minHeight: null,           
                    maxHeight: null,          
                    focus: true 

                });
                $('#shopContents').summernote({
    height : 350,
    toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'italic', 'underline', 'clear']],
        ['fontname', ['fontname']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'hr']],
        ['view', ['fullscreen', 'codeview']],
        ['help', ['help']]
      ]
 }); </script>
   <script src="../../../../resources/kdy/js/shop_files.js"></script>

   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abf31ecaa88152d20b1faa70bc69a3d1&libraries=services,clusterer,drawing"></script>
<script>
   var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapOption = {
        center: new kakao.maps.LatLng(37.480324403851085, 126.88364153429607), // ????????? ????????????
        level: 2 // ????????? ?????? ??????
    };  

// ????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ??????-?????? ?????? ????????? ???????????????
var geocoder = new kakao.maps.services.Geocoder();



var marker = new kakao.maps.Marker(), // ????????? ????????? ????????? ???????????????
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // ????????? ????????? ?????? ????????? ????????? ????????????????????????

// ?????? ?????? ??????????????? ????????? ???????????? ?????? ?????? ????????? ???????????????
searchAddrFromCoords(map.getCenter());

// ????????? ???????????? ??? ?????? ?????? ????????? ?????? ??????????????? ??????????????? ???????????? ???????????????
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            let detailAddr = !!result[0].road_address ? '<div>' + result[0].road_address.address_name + '</div>' : '';
            // console.log(result[0].road_address.address_name);
            let sa = result[0].road_address.address_name;
            // console.log('SA : '+sa);



            let content = '<div class="bAddr"> ' + detailAddr + '</div>';

            const shopAddress = document.querySelector("#shopAddress");
            
            shopAddress.value=sa;
            // ${'#shopAddress'}.val(sa);
            console.log(shopAddress);

            // ????????? ????????? ????????? ??????????????? 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // ?????????????????? ????????? ????????? ?????? ????????? ?????? ??????????????? ???????????????
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// ?????? ????????? ?????? ????????? ???????????? ??? ?????? ?????? ????????? ?????? ?????? ????????? ??????????????? ???????????? ???????????????
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter());
});

function searchAddrFromCoords(coords, callback) {
    // ????????? ????????? ?????? ????????? ???????????????
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // ????????? ????????? ?????? ?????? ????????? ???????????????
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// ?????? ??????????????? ?????? ??????????????? ?????? ??????????????? ???????????? ???????????????
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        // for(var i = 0; i < result.length; i++) {
        //     // ???????????? region_type ?????? 'H' ?????????
        //     if (result[i].region_type === 'H') {
        //         infoDiv.innerHTML = result[i].address_name;
        //         break;
        //     }
        // }
    }    
}
   </script>
  <!-- ===================================================================================================================================================== -->
  <script>
    // ????????? ???????????? ???????????? ????????? ??????????????? ?????????
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map2'), // ????????? ????????? div 
    mapOption = {
      center: new kakao.maps.LatLng(37.480324403851085, 126.88364153429607), // ????????? ????????????
        level: 2 // ????????? ?????? ??????
    };  

// ????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ?????? ?????? ????????? ???????????????
var ps = new kakao.maps.services.Places(); 

// ???????????? ????????? ???????????????
ps.keywordSearch(value="${detail.shopAddress}", placesSearchCB); 

// ????????? ?????? ?????? ??? ???????????? ???????????? ?????????
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // ????????? ?????? ????????? ???????????? ?????? ????????? ?????????????????????
        // LatLngBounds ????????? ????????? ???????????????
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[0]);    
            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
        }       

        // ????????? ?????? ????????? ???????????? ?????? ????????? ??????????????????
        map.setBounds(bounds);
    } 
}

// ????????? ????????? ???????????? ???????????????
function displayMarker(place) {
    
    // ????????? ???????????? ????????? ???????????????
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // ????????? ?????????????????? ???????????????
    kakao.maps.event.addListener(marker, 'click', function() {
        // ????????? ???????????? ???????????? ?????????????????? ???????????????
        // infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        // infowindow.open(map, marker);
    });
}
  </script>
<script>
  function goBack() {
      window.history.back();
  }
  </script>
<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>