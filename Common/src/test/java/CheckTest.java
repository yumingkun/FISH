import com.fish.service.FollowService;
import org.junit.Test;

public class CheckTest {

    @Test
    public void test(){
        FollowService followService=new FollowService();
         int num=followService.checkFollow(8,7);
    }
}
