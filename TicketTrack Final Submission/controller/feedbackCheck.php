<?php



    require_once('../model/shamimdb.php');
    if(isset($_POST['Submit'])){
        $rate_service= $_POST['rate'];
        $like_service = $_POST['like'];
        $suggestion = trim($_POST['suggestion']);
        



        if( !empty($suggestion))
        {
            $status = Feedback($rate_service, $like_service, $suggestion);
        
            echo json_encode($rate_service);
            echo json_encode($like_service);
            echo json_encode($suggestion);



            if($status){
              //  header('location: ../view/viewAmount.html');
              echo "Successful";
              
            } 
            
           else{
                header('location: ../view/feedback.php');
            }
           
        }
        else{

            echo "plz fill up all requirments";
           


        }



    }else{
        header('location: ../view/feedback.php');
    }

?>