---
source: "https://thinhnotes.com/chuyen-nghe-ba/erd-la-gi/"
source_name: "Thinh Notes - Chuyen nghe BA"
crawled: "2026-06-24"
type: "reference"
topic: "ERD - Entity Relationship Diagram (mo hinh thuc the quan he)"
note: "Tai lieu tham khao ngoai (blog BA tieng Viet) - dung giai thich/dinh huong, khong phai nguon yeu cau du an (CLAUDE.md §0)."
---

> Trich tu bai "ERD la gi?" tren Thinh Notes (https://thinhnotes.com/chuyen-nghe-ba/erd-la-gi/) - crawl 24/06/2026, giu phan noi dung bai (bo comment/footer/nav). Ban quyen thuoc tac gia goc; dung tham khao noi bo.

# ERD là gì?

![Vẽ ERD](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/15-phut-thuc-hanh-voi-erd-thinhnotes-header.png?fit=945%2C567&ssl=1)

Nguồn hình: unsplash.com/@icons8

ERD – Entity Relationship Diagram, cái tên không ít thì nhiều cũng khá quen với anh em chứ hả 🙂

Bài note hôm nay mình sẽ nói về ERD, một trong những công cụ không thể thiếu của người làm Business Analyst.

Sẽ là tất tần tật về ERD, một cách “thực tiễn” nhất có thể, bao gồm: *ERD là gì, các thành phần của ERD, hay vai trò của ERD đối với BA*. Và quan trọng nhất là 15 phút thực hành ERD để hiểu rõ: **thực sự ERD giúp ích được gì cho công việc của BA nhé** 😎

![](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ezgif-1-28dac2c5f18d.gif?resize=358%2C337&ssl=1)

# 1. ERD là gì?

ERD phun nem là *“Entity”* *“Relationship”* Diagram.

* *“Entity”* nghĩa là các **thực thể**
* *“Relationship”* là các **mối quan hệ**, (giữa các thực thể đó).

==> Vậy tóm gọn: *ERD là một **sơ đồ**, thể hiện **các thực thể** có trong database, và **mối quan hệ giữa chúng** với nhau.*

Còn một khái niệm khác anh em có thể nghe tới, đó là *Class Diagram*.

Mặc dù cách vẽ và hình dáng của 2 loại diagram này khá giống nhau. Nhưng Class Diagram và ERD là hai khái niệm ***hoàn toàn khác nhau***.

**Class** Diagram là “con” của nhà UML (Unified Modeling Languaget). Còn ERD là khái niệm đến từ concept của ERM (**Entity**-Relationship Modeling). Một kỹ thuật dùng để mô hình hóa cơ sở dữ liệu.

Một bên là *Class*, còn một bên là *Entity*.

* *Class là nhóm các Object có cùng các thuộc tính.*
* *Còn Entity thể hiện các Object ngoài đời thực.*

Ví dụ hệ thống built ra để quản lý đối tượng k*hách hàng*, *đơn hàng*, *sản phẩm*… Thì chính những *khách hàng*, *đơn hàng*, *sản phẩm*… đó là những đối tượng Entity.

Ngoài ra Entity thường được dùng để mapping với **khái niệm table** trong **relational database**, và nó có những business logic nhất định.

Nên, ERD – Entity Relationship Diagram sẽ giúp anh em hình dung tổng quan được các *“real business object”* mà hệ thống đang quản lý. Và đặc biệt nó thể hiện mối quan hệ giữa các *“real business object”* này với nhau.

![Ví dụ về ERD](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_la_gi_thinhnotes_7.jpg?w=672&h=471&ssl=1 "Bấm View Full Size để phóng to")

Ví dụ ERD của một hệ thống quản lý các hợp đồng dịch vụ và các hãng hàng không khách hàng.

# 2. ERD để làm gì?

Diagram này sẽ giúp anh em mần những chuyện sau:

**Giúp mường tượng tổng quan hệ thống có gì**

Tiếp cận theo hướng top-down, ERD sẽ giúp anh em liệt kê các đối tượng có trong hệ thống.

Từ đó, anh em dễ dàng scope được các chức năng của hệ thống. Không lo out of scope, không lo phân tích thiếu đối tượng, cũng như đảm bảo cung cấp đủ một lượng thông tin để setup database cho giai đoạn triển khai sau này.

Ví dụ: *hệ thống giúp quản lý hợp đồng, mà trong ERD không có đối tượng hợp đồng là tèo.*

[Góc nhìn top down](https://thinhnotes.com/chuyen-nghe-ba/bi-kip-chan-truyen-cua-ba/) bao giờ cũng quan trọng, nó giúp anh em xác định rõ ngay lập tức những thành phần có trong hệ thống, và mối quan hệ giữa chúng với nhau.

**Giúp phân tích hệ thống**

Trong những dự án maintenance, việc đọc hiểu ERD của hệ thống hiện tại là một cách hiệu quả để anh em nắm được tổng quan các đối tượng và chức năng giữa chúng với nhau.

*Ví dụ anh em thấy cục A quan hệ với cục B, cục B quan hệ với cục C.*

*Thì tức là, sẽ có một chức năng nào đó liên quan giữa cục A & cục B. Và một chức năng nào đó liên quan giữa cục B & cục C.*

*Khi nghiên cứu sâu hơn tài liệu Requirements, đôi lúc nó cũng sẽ giúp anh em phát hiện được những “behind the scenes” cực kỳ quan trọng nhưng lại chưa được thể hiện trong tài liệu.*

![](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ezgif-1-1d066bf35e1d.gif?resize=381%2C287&ssl=1)

**Giúp nắm rõ hơn tầng database**

Trong những system phức tạp, cấu trúc loằng ngoằng, hoặc chứa cả trăm table, việc **visualize các table ra hình ảnh** sẽ giúp anh em dễ dàng phát hiện ra những *điểm chưa hợp logic*, những mối quan hệ *“mờ ám”, “dư thừa”* giữa các table với nhau.

Ngoài ra, có một số tool hỗ trợ việc convert ERD thành dòng lệnh SQL chạy trên các DBMS, như: *Visual-Paradigm, ModelRight, hay Datanamic*. Từ đó giúp anh em tiết kiệm thời gian viết query.

**Giúp design report**

ERD sẽ giúp anh em hiểu được: **cấu trúc các table link với nhau** như thế nào.

Từ đó có thể viết các expression một cách chính xác nhất có thể *(tức viết các câu query để moi móc, tính toán, đo lường, hoặc so sánh các dữ liệu với nhau để ra được kết quả mong muốn).*

*Vì đôi lúc, có những quan hệ **nhiều – nhiều** anh em không thể xử lý expression trực tiếp được, mà phải thông qua một số table trung gian nào đó. ERD sẽ giúp anh em biết được: đó là những table nào. Từ đó, móc data ra như thế nào là chính xác nhất.*

# 3. Ai vẽ – ai dùng ERD?

Vì BA là người facing trực tiếp với khách hàng và [moi móc yêu cầu](https://thinhnotes.com/chuyen-nghe-ba/moi-moc-thong-tin-doi-voi-business-analyst/) từ họ. Nên rõ ràng, BA là người [hiểu rõ khách hàng](https://thinhnotes.com/chuyen-nghe-ba/requirement-trong-business-analyst-duoc-xu-ly-the-nao/) muốn gì nhất.

**BA chính là người phác họa ra ERD**: *mô tả những đối tượng có trong hệ thống, thuộc tính và mối quan hệ giữa chúng ra sao.*

Vậy thì vẽ ERD xong, ai là người dùng?

Cũng chính ***BA*** luôn, à há.

BA vẽ ERD để capture lại các components có trong hệ thống. Và BA cũng dùng ERD để làm tài liệu thiết kế luôn. Tuy nhiên, ngoài việc tự sướng, tự cung tự cấp ra, thì BA còn vẽ ERD để…

Cung cấp cho các ***Database Designer***, để họ thiết kế database trong giai đoạn triển khai. Và dĩ nhiên, anh em ***Developer*** cũng rất cần đọc bản thiết kế này.

Để biết được phạm vi các đối tượng cần quản lý, biết được độ lớn của system. Có thể phần nào hiểu được chức năng đằng sau các đối tượng này, và tìm cách tối ưu database sao cho tiết kiệm tài nguyên nhất có thể.

…

*Ô kê nãy giờ anh em đã nắm sơ bộ ERD rồi, giờ mình sẽ đi vào chi tiết, để xem hình thù của một ERD nó trông thế nào nhé.*

![](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ezgif-1-d996697f844a.gif?resize=435%2C242&ssl=1)

# 4. Ba thành phần của một ERD

Như anh em đã biết, chưa biết, hoặc biết rồi mà làm bộ chưa biết, thì ERD gồm 3 thành phần chính:

* **Entity**: *thực thể (hoặc đối tượng) mà hệ thống quản lý*
* **Attribute**: *thuộc tính của các đối tượng.*
* Và **Relationship**: *mối quan hệ giữa các đối tượng.*

## 4.1. Entity

Entity là những đối tượng như: *người, vật, sự việc, hoặc địa điểm…* nào đó, mà anh em muốn lưu trữ thông tin trên hệ thống.

Thường thì Entity **rất dễ hình dung** trong hệ thống.

Nhưng cũng có một vài entity không tồn tại ở business thực tế bên ngoài. *Nó là những entity trung gian, nằm giữa 2 entity khác, và thể hiện mối quan hệ nhiều-nhiều giữa 2 entity này với nhau.*

![ERD là gì](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_la_gi_thinhnotes_2.png?resize=676%2C419&ssl=1)

Entity được thể hiện bằng hình chữ nhật đứng, tên nằm ngay chính giữa.

Entity *PHẢI LUÔN* là danh từ nhé anh em.

## 4.2. Attribute

Attribute nghĩa là **thuộc tính**. Thuộc tính của chính những entity này.

Nói thuộc tính nghe có vẻ *“IT”* quá. Anh em có thể hiểu nó là các **đặc tính** của một đối tượng bất kỳ. Là những thông tin **riêng biệt** của đối tượng đó mà mình sẽ lưu trữ.

Ví dụ **Đơn hàng** sẽ có 5 thông tin riêng biệt sau, mà chỉ có đơn hàng mới có, mấy thằng khác không có, như:

* *Ngày đặt hàng*
* *Tổng tiền chưa giảm*
* *Tiền khuyến mãi*
* *Thành tiền*
* *Điều khoản thanh toán.*

Hoặc **Khách hàng** sẽ có 7 thông tin riêng biệt sau mà mấy thằng khác không có, như:

* *Họ và tên*
* *Email*
* *Ngày sinh nhật*
* Số điện thoại
* *Sở thích*

Có thể đối tượng *Đơn hàng* và *Khách hàng* sẽ còn rất nhiều thông tin khác, nhưng mình **chỉ quan tâm đến nhiêu đây thông tin**, nên mình **chỉ lưu trữ nhiêu đây attribute** thôi.

![ERD là gì](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_la_gi_thinhnotes_5.png?resize=676%2C419&ssl=1)

Các thuộc tính sẽ được liệt kê ngay trong thực thể.

Chỗ PK *(Primary Key)* và FK *(Foreign Key)* để lát nói sau nhé anh em.

## 4.3. Relationship

![](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/IMG_7769.jpg?resize=403%2C411&ssl=1)

Về cơ bản thì relationship của ERD có 3 loại:

1. *One-to-One: quan hệ **1-1***
2. *One-to-Many: quan hệ **1-nhiều***
3. *Many-to-Many: quan hệ **nhiều-nhiều.***

Từ 3 loại này, anh em sẽ thể hiện chi tiết hơn bằng 6 mối quan hệ như sau:

![ERD là gì](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_la_gi_thinhnotes_6.png?resize=676%2C315&ssl=1)

6 mối quan hệ chi tiết trong ERD.

Mình sẽ thực tế hơn cho anh em bằng sê ri: ***Mối quan hệ giữa Y TÁ vs. BỆNH NHÂN** trong một hệ thống quản lý bệnh viện như sau.*

*(Slideshow có nút Pause ở giữa nhé anh em)*

Trình chiếu này yêu cầu JavaScript.

Hi vọng seri trên giúp anh em hiểu được chi tiết 6 mối quan hệ của ERD. Và quan trọng nhất, là **cách đọc** các mối quan hệ này.

*Hiểu để làm gì?*

Để khi khách hàng mô tả bằng *ngôn ngữ thường ngày* của họ, thì anh em có thể lấy cái đó >> chuyển hóa nó thành *ngôn ngữ ERD* >> và **phác thảo các mối quan hệ** ra như vầy.

Mấu chốt là anh em cần nhìn được: **Quan hệ giữa 2 thực thể đó là gì?**

*Khi đó, ghép vào bối cảnh cụ thể, anh em sẽ hiểu được mối quan hệ giữa hai thực thể này là gì, và qua lăng kính business thực tế là như thế nào?*

**❓ ❓ ❓ Ví dụ tìm mối quan hệ giữa các thực thể sau:**

* Khách hàng – Đơn hàng
  + *Khách hàng **có** Đơn hàng*
  + *Đơn hàng **thuộc về** Khách hàng.*
* Người dùng – Đặt chỗ (Booking)
  + *Người dùng **tiến hành đặt** Booking*
  + *Booking **được đặt** bởi Người dùng.*
* Dịch vụ – Hợp đồng
  + *Dịch vụ **nằm trong** Hợp đồng*
  + *Hợp đồng **bao gồm** Dịch vụ.*
* Nhân viên CSKH – Khách hàng
  + *NV **chăm sóc** Khách hàng*
  + *Khách hàng **được chăm sóc** bởi NV.*
* Sinh Viên – Sách
  + *Sinh viên **mượn** Sách*
  + *Sách **được mượn** bởi Sinh viên.*
* Khách hàng – Hoạt động tương tác
  + *Khách hàng **thực hiện** Hoạt động tương tác*
  + *Hoạt động tương tác **được thực hiện** bởi Khách hàng.*

Ngoài ra, anh em có thể *chú thích rõ mối quan hệ* này bằng một **hình con thoi** nhỏ.

![ERD là gì](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_la_gi_thinhnotes_22.png?resize=676%2C313&ssl=1)

Chú thích này giúp anh em đọc ERD dễ hơn, nhưng cũng dễ gây rối hình.

Tóm gọn váy lần một:

* Mối quan hệ giữa các thực thể đều là: **ĐỘNG TỪ***(có, thuộc, đặt, chăm sóc, mượn, thực hiện…)*
* Khi đọc mối quan hệ theo chiều ngược lại, anh em chỉ cần chuyển nó thành **THỂ BỊ ĐỘNG** là xong 🙂 *(được mượn, được chăm sóc, được thực hiện…).*

Tóm gọn váy lần hai, anh em có thể thấy:

* Thực thể ám chỉ **DANH TỪ**
* Thuộc tính ám chỉ **TÍNH TỪ**, chỉ những tính chất – đặc điểm của thực thể *(ví dụ khách hàng thì cao 175cm, nặng 65kg, giới tính Nam, địa chỉ nhà, email…)*
* Còn mối quan hệ thì ám chỉ **ĐỘNG TỪ**.

Nhận diện được những đối tượng này, anh em sẽ dễ dàng **bóc tách ngôn ngữ thường ngày** của khách hàng thành các đối tượng trong ERD ==> phác họa nhanh chóng & chính xác hơn.

***\*NOTE KHÔNG HỀ NHỎ: Thực hư quan hệ NHIỀU-NHIỀU quay đi quẩn lại cũng chính là quan hệ 1-NHIỀU. Chi tiết như nào xem tiếp phần dưới nhé anh em 😎***

![](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ezgif-2-e3a836c88b11.gif?resize=387%2C339&ssl=1)

# 5. Thực hư 1-1, 1-nhiều, và nhiều-nhiều?!?

Ô kê xam bu chêêêêê.

Phần trên anh em đã hiểu được: ***entity***, ***attribute*** và ***relationship*** trong ERD. Nhưng nếu anh em vẫn còn thắc mắc:

> *Vẽ như zậy rồi trên hệ thống nó chạy ra sao.*
>
> ***1-nhiều**, rồi **nhiều-nhiều** THỰC TẾ khác nhau như thế nào?*

Thì ở phần dưới đây, mình sẽ giải đáp thắc mắc này cho anh em.

## 5.1. Relational Database

Đầu tiên anh em cần mường tượng lại đôi chút về Relational Database.

***Relational Database*** nôm na là các database được **tổ chức** thành nhiều **bảng**, và giữa các bảng **quan hệ** với nhau bằng các **khóa**.

*Mà bảng (table) là gì?*

Mapping với khái niệm ERD, **1** **table chính là 1 entity** *(một đối tượng, hoặc một thực thể)* mà database lưu trữ.

![Ví dụ về table](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/table-la-gi-2-thinhnotes.png?w=672&h=397&ssl=1 "Table")

Ví dụ về table Customer (Nguồn ảnh: Microsoft)

Table thì đơn thuần có các ***cột*** và ***dòng***. Như ví dụ trên:

* **Cột** chính là thuộc tính (attribute) của đối tượng Customer, bao gồm cột: *Last Name, First Name, Email, bla, bla…* các kiểu.
* Còn **dòng** là các *“bản ghi”,* **mình hay gọi là các *record***, là số lượng dữ liệu mà table đó lưu trữ trong database.

Từ ví dụ trên, anh em có thể kết luận như sau về table Customer:

* Table này gồm 6 thuộc tính *(Full Name, First Name, Last Name, Email, Company Name và Business Phone)*
* Table này hiện đang lưu trữ 23 records *(vì có 23 dòng dữ liệu).*

Tuy nhiên, vì table lưu trữ nhiều record quá ==> nhu cầu phát sinh: ***c**ần phân biệt các record với nhau*** ==> **khóa chính** (Primary Key) ra đời.

Bản chất thì khóa chính **cũng chỉ là một cột**, trong hằng hà các cột mà table lưu trữ. Nhưng nó khác biệt ở chỗ:

Nói theo xì tai của anh Người Phán Xử thì:

> *Khóa chính là thứ tồn tại độc lập duy nhất (và không được giống nhau).
> Tất cả những cột khác, giống nhau hay không, không quan trọng.*

Còn nói theo ngôn ngữ lập trình thì: *khóa chính là thứ để định danh duy nhất mỗi bản ghi trong table của cơ sở dữ liệu.*

Tiếp theo là ***khóa ngoại** (Foreign Key).*

Vì các table liên kết với nhau. Nhưng để liên kết với nhau thì nó **cần có điểm chung** nào đó. Foreign Key chính là điểm chung đó. Nó là key dùng để liên kết 2 tables lại với nhau.

**Foreign Key** sẽ là Primary Key ở một table, nhưng lại là Foreign Key ở một table khác mà table đó liên kết đến.

![](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/fk-tables-001.png?resize=676%2C423&ssl=1)

Foreign Key là gì? (Nguồn ảnh: hostingadvice.com)

## 5.2. Giải nghĩa các mối quan hệ

Phần này giải thích cho câu hỏi nhức nhối nhất nãy giờ: ***Đâu là sự khác biệt trên hệ thống thực tế, giữa các quan hệ:***

* ***1-1***
* ***1-nhiều***
* ***Và nhiều-nhiều***

Bằng cách, mang anh em đến với phần mềm thực tế 😎

.

.

.

Ô kê, đầu tiên mình có 4 entity với các attribute như sau.

![ERD là gì Thinhnotes](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_Thinhnotes_5.jpg?resize=676%2C569&ssl=1)

Nhà có 4 anh em: A, B, C và D.

Mình sẽ cho 4 entity này quan hệ với nhau như sau:

* *D quan hệ **1-1** với A*
* *A quan hệ **1-nhiều** với B*
* *B quan hệ **nhiều-nhiều** với C.*

![ERD là gì Thinhnotes](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_Thinhnotes_6.jpg?resize=676%2C797&ssl=1)

4 anh em quan hệ dây mơ rễ má zới nhau.

Nhưng khoan,

Anh B và anh C đang *quan hệ nhiều-nhiều*. Chỗ này thực tế nó sẽ không quan hệ nhiều-nhiều trực tiếp với nhau như vầy, mà cần thông qua một **entity trung gian.**

Thế là Entity E ra đời. Ảnh **chen vào giữa** anh B và anh C như sau.

![ERD là gì Thinhnotes](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_Thinhnotes_7.jpg?resize=676%2C1079&ssl=1)

Thực hư quan hệ nhiều – nhiều.

Ô kê tới đây anh em đã có: *các thực thể* và*đã liên kết chúng với nhau.*

…

Nhưng trước khi đi tiếp mình có 1 câu hỏi: ***Bản chất quan hệ 1-nhiều nghĩa là sao?***

Ví dụ A quan hệ 1-nhiều với B.

Nghĩa là, 1 record A bao gồm rất nhiều record B. Hoặc, nhiều record B cùng liên kết đến 1 record A.

Do đó, để hình dung quan hệ 1-nhiều dễ dàng, anh em cứ hình dung đến cái **LƯỚI** hoặc **BẢNG** là được. Vì lưới hoặc bảng có **rất nhiều DÒNG** trong đó.

**Nếu A quan hệ 1-nhiều với B, nghĩa là trên A có một cái LƯỚI hoặc một cái BẢNG chứa các dòng dữ liệu B.** Chỉ đơn giản zậy thôi!

*Dưới đây sẽ là: đối chiếu giữa ERD và thực tế phần mềm để anh em hình dung rõ điều mình vừa nói ở trên nhé.*

*(Slide Show có nút Pause chính giữa nhé anh em).*

Trình chiếu này yêu cầu JavaScript.

Để ví dụ trên dễ hình dung, mình sẽ thay các entity giả định này bằng các **entity thực tế** như sau.

[![ERD là gì - Thinhnotes](https://i0.wp.com/thinhnotes.com/wp-content/uploads/2019/09/ERD_la_gi_thinhnotes_22.jpg?w=672&h=411&ssl=1 "Bấm Full Size để phóng to")](https://thinhnotes.com/chuyen-nghe-ba/erd-la-gi/attachment/erd_la_gi_thinhnotes_22-2/)

ERD map với thực tế

Có một mẹo chỗ này: ***Làm sao để xác định FK cho nhanh?***

Nếu 2 table quan hệ **1-nhiều** với nhau, anh em chỉ cần lấy **PK** của table ở đầu quan hệ 1, bỏ vào **FK** của table ở đầu quan hệ nhiều, là xong 🙂

…

Đọc tiếp phần 2 tại: [***15 phút thực hành với sơ đồ ERD***](https://thinhnotes.com/chuyen-nghe-ba/15-phut-thuc-hanh-voi-so-do-erd/).
