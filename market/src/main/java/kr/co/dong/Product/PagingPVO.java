package kr.co.dong.Product;

public class PagingPVO {
 
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
		private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end, exPage;
		private int cntPage = 10;
		private String keyWord; 
		
	
		public PagingPVO() {
		}
		public PagingPVO(int total, int nowPage, int cntPerPage, String keyWord) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			if(keyWord!=null) {
				setkeyWord(keyWord);
				System.out.println("누구나 : "+keyWord);
			} else {
				setkeyWord("");
			}
			
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
			
		}
		
		
		
		
		
		
		// DB 쿼리에서 사용할 start, end 값 계산
		private void calcStartEnd(int nowPage, int cntPerPage) {
			// TODO Auto-generated method stub
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage);
			if(nowPage > lastPage) {
				setExPage(lastPage);
			}else {
				setExPage(nowPage);
			}
		}
		
		// 시작, 끝 페이지 계산
		private void calcStartEndPage(int nowPage, int cntPage) {
			// TODO Auto-generated method stub
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			if(getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			setStartPage(getEndPage() - cntPage);
			if(getStartPage() < 1) {
				setStartPage(1);
			}
		}
		
		// 제일 마지막 페이지 계산
		private void calcLastPage(int total2, int cntPerPage2) {
			// TODO Auto-generated method stub
			setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
		}
		
		public String getkeyWord() {
			return keyWord;
		}
		public void setkeyWord(String keyWord) {
			this.keyWord = keyWord;
		}
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public int getEndPage() {
			return endPage;
		}
		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
		public int getCntPerPage() {
			return cntPerPage;
		}
		public void setCntPerPage(int cntPerPage) {
			this.cntPerPage = cntPerPage;
		}
		public int getLastPage() {
			return lastPage;
		}
		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
		public int getStart() {
			return start;
		}
		public void setStart(int start) {
			this.start = start;
		}
		public int getEnd() {
			return end;
		}
		public void setEnd(int end) {
			this.end = end;
		}
		public int getCntPage() {
			return cntPage;
		}
		public void setCntPage(int cntPage) {
			this.cntPage = cntPage;
		}
		public int getExPage() {
			return exPage;
		}
		public void setExPage(int exPage) {
			this.exPage = exPage;
		}
		@Override
		public String toString() {
			return "PagingPVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total="
					+ total + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end="
					+ end + ", exPage=" + exPage + ", cntPage=" + cntPage + ", keyWord=" + keyWord + "]";
		}
	
	}
