import com.fish.dao.FollowDao;
import com.fish.service.FollowService;
import org.junit.Test;

public class FollowTest {

    @Test
    public int test(){
        FollowService followService=new FollowService();
        return followService.checkFollow(8,7);
    }
}
