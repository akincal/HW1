
## Tasarım Kararları

- **Modüler Ayrım**: Projede, lexical analiz ve sözdizimi analizini ayrı dosyalarda tutarak sorumlulukların net bir şekilde ayrılmasını sağladık. Bu, kodun bakımı ve genişletilmesi açısından büyük avantaj sağlar.
- **Lex ile Tokenizasyon**: Girdinin tokenize edilmesi için Lex kullanıldı. Böylece sayı, operatör gibi bileşenler kolaylıkla ayrıştırılabiliyor.
- **Yacc ile Gramer Kuralları**: Hesap makinesinin dilini tanımlamak için Yacc tercih edildi. Gramer kuralları sayesinde, kullanıcı girdisinin doğru yorumlanması ve hesaplama işlemlerinin gerçekleştirilmesi sağlandı.
- **Hata Yönetimi**: Temel hata kontrol mekanizmaları entegre edilmiştir. Yanlış girilmiş ifadeler uygun hata mesajları ile kullanıcıya bildirilir.

## Uygulama Adımları

1. **Lex Dosyası (calculator.l) Hazırlığı**:  
   - Girdi içindeki rakamları, operatörleri ve boşlukları tanımlamak için düzenli ifadeler yazıldı.
   - Her token için gerekli dönüş değerleri belirlendi.

2. **Yacc Dosyası (calculator.y) Hazırlığı**:  
   - Hesap makinesinin grameri (aritmetik ifadelerin yapısı) belirlendi.
   - Her gramer kuralı için uygun aksiyonlar (hesaplamalar) tanımlandı.
   - Hata durumlarında kullanıcıya mesaj verilmesi için hata kontrol mekanizmaları eklendi.

3.Derleme ve Çalıştırma İçin Basit Komutlar:

Lex kaynak kodunu oluşturmak için:
lex calculator.l
Yacc kaynak kodunu oluşturmak için:
yacc -d calculator.y
Lex ve Yacc tarafından üretilen C kodunu derlemek için:
gcc lex.yy.c y.tab.c -o calculator
Programı çalıştırmak için:
./calculator

