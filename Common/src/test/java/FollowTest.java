import com.fish.dao.FollowDao;
import org.junit.Test;

public class FollowTest {

    @Test
    public void test(){
        FollowDao followDao=new FollowDao();
        followDao.addFollow(1,2);
    }
}
