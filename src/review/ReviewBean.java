package review;


public class ReviewBean {
	private int reviewNo = 0;
    private String restaurantNo = null;
    private String reviewUserID = null;
    private String reviewContents = null;
    private String reviewRating = null;
    private String reviewDate = null;
    
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(String restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public String getReviewUserID() {
		return reviewUserID;
	}
	public void setReviewUserID(String reviewUserID) {
		this.reviewUserID = reviewUserID;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(String reviewRating) {
		this.reviewRating = reviewRating;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
}
