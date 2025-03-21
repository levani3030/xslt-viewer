<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ინფორმირებული თამხმობა</title>
        <style>
        /* Global box-sizing for all elements */
*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
    height: 100%;
    margin: 0;
    padding: 0;
}

body {
  background-color: white;
  font-family: Arial, sans-serif;
}

.clinic-logo {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 2rem;
}

.main-wrapper {
    margin: 2rem;
}


.doctitle {
    display: flex;
    font-size: 1.6rem;
    font-weight: 800;
    color: #000;
    text-align: center;
    justify-content: center;
    margin: 2rem;
}

.patient-info {
    /* background-color: rgba(200, 200, 200, 0.2); */
    border-radius: 1rem;
    /* max-width: 60rem; */
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    justify-content: center;
    padding: 1rem;
    /* min-height: 20rem; */
    width: 100%
}

.patient-info-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.1rem;
    align-items: stretch;
    /* width: 100% */
}

.patient-info-box {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 1.2rem;
    padding: 1rem;
}
.patient-info-box-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.patient-info-title {
    font-size: .8rem;
    margin-bottom: 0.5rem;
    color: #000;
}

.patient-info-data {
    background-color: rgba(200, 200, 200, 0.2);
    /* border: solid 2px #0000006a; */
    border-radius: .7rem;
    min-width: 10rem;
    padding: 0.4rem;
    font-size: 1.2rem;
    text-align: center;
    font-weight: 500;
    color: #000;
}

.patient-info-data .fullname {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}

.fullname span {
    font-size: 1.2rem;
    font-weight: 500;
    color: #000;
    padding-left: 0.4rem;
}

.patient-status-dropdown {
    position: relative;
    display: inline-block;
}

.patient-status {
    border: none;
    background: transparent;
    font-family: inherit;
    font-size: inherit;
    color: inherit;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    width: 100%;
    cursor: pointer;
    outline: none;
    padding: 0 1rem;
    line-height: 1.5;
}

.patient-status-dropdown-icon {
    position: absolute;
    top: 40%;
    right: 0;
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #000;
    pointer-events: none;
}

.patient-status option {
    padding: 0.5rem 1rem;
    line-height: 1.5;
}

.consent-section {
    margin-top: 2rem;
    width: 100%;
    background-color: rgba(200, 200, 200, 0.2);
    height: auto;
    border-radius: 1rem;
    padding: 1rem;
}

.consent-section ul {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    padding-left: 1rem;
}

.patient-section {
    margin: 3rem;
    gap: 1rem;
}

.patient-signature {
    width: 100%;
    display: flex;
    justify-content: space-between;
    gap: 1rem;
}

.patient-sigmature-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 1rem;
}

.patient-signature-noncapable {
    max-width: 80rem;
    display: flex;
    gap: 1rem;
}

.patient-signature-wrapper {
    display: flex;
    flex-direction: row;
    white-space: nowrap;
    gap: 1rem;
    align-items: center;
    text-align: center;
    justify-content: flex-start;
}

.patient-signature-wrapper p, .patient-signature-date p  {
    font-size: .8rem;
}
.patient-signature-id {
    padding-left: 1rem;
}

.patient-signature-form {
    margin-top: 0;
}
.patient-signature-form2 {
    margin-top: 4rem;
}

.patient-signature-wrapper input, .patient-signature-id input {
    width: auto;
    padding: 0.2rem 0.5rem;
    border-radius: 0.5rem;
    border: 1px solid #000;
    font-size: 1rem;
}

.patient-signature-date {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 1rem;
    margin-left: auto; /* Align to the right */
}

.footer {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10rem;
}

.footer-wrapper {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: rgba(200, 200, 200, 0.2);
    width: 18rem;
    height: auto;
    border-radius: 1rem;
    padding: .75rem;
    gap: .5rem;
}



@media print {
    .patient-status-dropdown-icon {
        display: none;
    }

    .patient-info-data,
    .consent-section,
    .footer-wrapper {
        background-color: rgba(200, 200, 200, 0.2) !important;
    }

    /* Avoid page breaks inside these elements */
    .patient-info, .consent-section, .footer-wrapper {
        page-break-inside: avoid;
    }

    /* Ensure the body takes up the full height */
    body {
        height: auto;
    }
}
        </style>
      </head>
      <body>
        <header>
          <div class="clinic-logo">
            <img src="logo.svg" alt="Kirurgia"/>
          </div>
                <!-- <pre>
                  <xsl:copy-of select="."/>
                </pre> -->
        </header>
        <div class="main-wrapper">
          <div class="doctitle">
            <p>პაციენტის წერილობითი, ინფორმირებული თანხმობა სამედიცინო მომსახურების გაწევაზე</p>
          </div>
          <div class="patient-info">
            <div class="patient-info-wrapper">
              <div class="patient-info-box">
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-title">სახელი და გვარი</p>
                  <p class="patient-info-data fullname">               
                    <span> <xsl:value-of select="/Root/Firstname"/></span>
                    <span> <xsl:value-of select="/Root/Lastname"/></span>
                  </p>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-title">ელ-ფოსტა</p>
                  <p class="patient-info-data">
                    <xsl:value-of select="/Root/Email"/>
                  </p>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-title">პაციენტი</p>
                  <div class="patient-info-data">
                    <div class="patient-status-dropdown">
                      <select name="patient-status" id="patient-status" class="patient-status">
                        <option value="capable" selected="selected">ქმედითუნარიანია</option>
                        <option value="noncapable">ქმედუუნაროა</option>
                        <option value="cantsign">ვერ აწერს ხელს</option>
                      </select>
                      <span class="patient-status-dropdown-icon"></span>
                    </div>
                  </div>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-title">პირადი ნომერი</p>
                  <p class="patient-info-data">
                    <xsl:value-of select="/Root/PersonalId"/>
                  </p>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-title">ტელეფონი</p>
                  <p class="patient-info-data">
                    <xsl:value-of select="/Root/PhoneNumber"/>
                  </p>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-title">მისამართი</p>
                  <p class="patient-info-data">
                    <xsl:value-of select="/Root/Address"/>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <section class="consent-section">
            <ul>
              <li>
                ექიმისაგან მივიღე ინფორმაცია დაავადების არსის, დიაგნოზის და სავარაუდო პროგნოზის შესახებ, ინფორმირებული ვარ
                მკურნალობაზე უარის თქმის შემთხვევაში უარყოფითი ან/და ლეტალური შედეგების     რისკის არსებობის შესახებ და ვიძლევი
                თანხმობას მკურნალობის ჩატარებაზე. გავეცანი გამოკვლევათა გეგმას, მკურნალობის     ტაქტიკას, სტრატეგიას, პირობებს და
                ვეთანხმები მას.
          </li>
              <li>
            ხელს ვაწერ რა დოკუმენტს, ვიძლევი თანხმობას პაციენტისათვის აუცილებელი ყველა სამკურნალო ღონისძიების ჩატარებაზე და მათ შესრულებას ვანდობ სს “კ. ერისთავის სახ. ექსპერიმენტული და კლინიკური ქირურგიის ეროვნული ცენტრის პერსონალს.
          </li>
              <li>
            ვაცნობიერებ, რომ მკურნალობის მსვლელობისას შესაძლებელია წარმოიშვას არასტანდარტული სიტუაციები,
            გაუთვალისწინებელი გარემოებები და გართულებები და რომ ამ შემთხვევაში მკურნალობის ტაქტიკა და ტექნოლოგიები შეიძლება
            შეცვლილი იქნეს ექიმის მიერ. წარმოშობილი სიტუაციის შესაბამისად, ავადმყოფის ინტერესებიდან გამომდინარე შესაძლებელია, პაციენტს დამატებით ჩაუტარდეს გამოკვლევები,ინტენსიური თერაპია, ოპერაციები, ფილტვების ხელოვნური ვენტილაცია,
            ჰემოდიალიზი, პერიტონიალური დიალიზი, ჰემოტრასფუზიები, ენდოსკოპიური მანიპულაციები და ა.შ
          </li>
              <li>
            ვაცნობიერებ, რომ ოპერაცია სტანდარტულ შემთხვევებშიც კი დაკავშირებულია სისხლის დაკარგვის, ოპერაციის მიდამოს
            ინფიცირების, გულ-სისხლძარღვთა სისტემის და სხვა ორგანო თა ფუნქციის დარღვევის, აგრეთვე სხვა გართულებებისა და
            არასასურველი გამოსავლის რისკთან.
          </li>
              <li>
            ვაცნობიერებ, რომ კრიტიკული და გადაუდებელი მედიცინის სტუქტურულ ერთეულებში მკურნა ლობის პერიოდში შესაძლოა
            ადგილი ჰქონდეს ისეთ გართულებებს, როგორიცაა: სინუსიტი, ნოზოკომიური პნევმონია, სეფსისი, ცენტრალური და პერიფერიული
            ვენების თრომბოზი, პნევმოთორაქსი, ჰიდროთორაქსი, პერიკარდიტი, ფილტვის არტერიის თრომბოემბოლია, თავის ტვინის
            ინფარქტი, გულსისხლძარღვთა და სხვა შინაგან ორგანოთა ფუნქციის მოშლა და ეს გარ თულებები შეიძლება განვითარდეს
            მკურნალობის ყველა წესის დაცვის და პროფილაქტიკური ღონისძიებების ჩატარების მიუხედავად.
          </li>
              <li>
            გარანტიები მკურნალობის საბოლოო შედეგებთან დაკავშირებით სამედიცინო პერსონალისაგან არ მიგვიღია.
          </li>
              <li>
            ინფორმირებული ვარ იმის შესახებ, რომ საჭიროა ექიმს ვაცნობო პაციენტის ჯანმრთელობის მდგომარეობასთან დაკავშირებული
            ყველა გარემოება. ისეთი ფაქტების დამალვის შემთხვევაში (ალერგიული გამოვლინებები,წამლების ინდივიდუალური აუტანლობა,
            ჩატარებული ჰემოტრანსფუზიები, აგრეთვე ნარკოტიკებისა და ალკოჰოლის ბოროტად გამოყენება, თანმხლები დაავადებები), რომლებმაც შესაძლოა გავლენა იქონიონ მკურნალობაზე და მის შედეგებზე, სამედიცინო პერსონალი იხსნის პასუხისმგებლობას.
          </li>
              <li>
          ინფორმირებული ვარ იმის შესახებ, რომ ოპერაციამდე, ოპერაციის მსვლელობისას, მას შემდეგ ან მის გარეშე შესაძლებელია
          სისხლის დაკარგვა ან მისი აუცილებელი გადასხმა. მიღებული მაქვს გარკვეული ინფორმაცია სისხლისა და მისი კომპონენტების
          ტრანსფუზიის არსისა და შესაძლო გართულებების შესახებ და ვიძლევი თანხმობას ღონისძიებების ჩატარებაზე ჩემი დამატებითი
          ინფორმირების გარეშე.
          </li>
              <li>
            ინფორმირებული ვარ, რომ მკურნალობის პროცესში შესაძლოა საჭირო გახდეს ჩემი კვლევები ისეთი მოწყობილობებით, რომლებიც გამოასხივებენ მაიონიზირებელ რადიაციას (რენტგენით კვლევა ,კომპიუტერული ტომოგრაფია და ა.შ.) და ვიძლევი თანხმობას.
            </li>
              <li>
              ინფორმირებული ვარ, რომ ჩემი პერსონალური მონაცემები უნდა გადაეცეს ჩემს მზღვეველ კომპანიას/საყოველთაო ჯანდაცვის პროგრამას, რათა ანაზღაურდეს ჩატარებული მკურნალობა და ვაცხადებ თანხმობას.
            </li>
              <li>
              ინფორმირებული ვარ კლინიკის მუშაობის რეჟიმის შესახებ, ვაცნობიერებ მას და თანახმა ვარ დავიცვა დადგენილი წესები.
              </li>
              <li>
                მე უფლებას ვაძლევ ექიმს გამოაქვეყნოს ინფორმაცია ჩატარებული მანიპულაციის შესახებ სამეცნიერო მიზნით, ილუსტრაციების და აღწერილობითი ტექსტის თანხლებით, რომელიც გამორიცხავს პაციენტის იდენტიფიცირებას.
                </li>
              <li>
              ინფორმირებული ვარ იმის შესახებ, რომ მკურნალობა პაციენტს ჩაუტარდება საყოველთაო ჯანდაცვის პროგრამის, სადაზღვევოპაკეტის, შიდა სტანდარტის მიხედვით. სჯ. პროგრამა და სადაზღვევო ვაუჩერი გულისხმობს პაციენტის მკურნალობის ხარჯებისანაზღაურებას კლინიკასთან შეთანხმებული ფასებით. ხოლო შიდა სტანდარტის შემთხვევაში კლინიკაში არსებული ტარიფებით შეფასებულ მკურნალობის ღირებულებას ანაზღაურებს თვით პაციენტი ან მისი სპონსორი.
                </li>
              <li>
              დოკუმენტის ყველა პუნქტს გავეცანი და ვეთანხმები მას.
                </li>
              <li>
              თანხმობაზე ხელმოწერით ვადასტურებ პერსონალური მონაცემების სისწორეს.
                </li>
            </ul>
          </section>
          <div class="patient-section">
            <div class="patient-signature capable">
              <!-- Content for capable -->
              <div class="patient-sigmature-container">
                <div class="patient-signature-wrapper">
                  <p>პაციენტის ხელმოწერა:</p>
                  <div class="patient-signature-form">_________________________</div>
                </div>
                <div class="patient-signature-wrapper">
                  <p>პირადობის მოწმობა (ან სხვა დოკუმენტი):</p>
                  <div class="patient-signature-id">
                    <xsl:value-of select="/Root/PersonalId"/>
                  </div>
                </div>
              </div>
              <div class="patient-signature">
                <div class="patient-signature-date">
                  <p>ხელმოწერის თარიღი:
                    <xsl:value-of select="concat(substring(/Root/Today, 9, 2), '/', substring(/Root/Today, 6, 2), '/', substring(/Root/Today, 1, 4))"/>
                  </p>
                </div>
              </div>
            </div>
            <div class="patient-signature noncapable" style="display: none;">
              <!-- Content for noncapable -->
              <div class="patient-sigmature-container">
                <div class="patient-signature-wrapper">
                  <p>პაციენტის ნათესავის ან მისი წარმომადგენლის სახელი:</p>
                  <input type="text"/>
                  <p>გვარი:</p>
                  <input type="text"/>
                </div>
                <div class="patient-signature-wrapper">
                  <p>ნათესაური კავშირი:</p>
                  <input type="text"/>
                  <p>პირადობის მოწმობა (ან სხვა დოკუმენტი):</p>
                  <input type="text"/>
                </div>
                <div class="patient-signature-wrapper" style="margin-top: 4rem;">
                  <p>ხელმოწერა:</p>
                  <div class="patient-signature-form">_________________________</div>
                </div>
                <div class="patient-signature">
                  <div class="patient-signature-date">
                    <p>ხელმოწერის თარიღი:
                      <xsl:value-of select="concat(substring(/Root/Today, 9, 2), '/', substring(/Root/Today, 6, 2), '/', substring(/Root/Today, 1, 4))"/>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="patient-signature cantsign" style="display: none;">
              <!-- Content for cantsign -->
              <p>ვერ აწერს ხელს!</p>
              <div class="patient-signature">
                <div class="patient-signature-date">
                  <p>თარიღი:
                    <xsl:value-of select="concat(substring(/Root/Today, 9, 2), '/', substring(/Root/Today, 6, 2), '/', substring(/Root/Today, 1, 4))"/>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="footer">
          <div class="footer-wrapper">
            <label id="currentYearLabel" style="font-size: .8rem; color:rgb(144, 144, 144)">
      </label>
            <div style="display: flex; align-items: center; gap: .8rem">
              <img src="phone.svg" alt="phone"/>
              <label id="currentYearLabel" style="font-size: .8rem; color:rgb(144, 144, 144)">
          (+995 32) 2 02 25 25
        </label>
            </div>
          </div>
        </div>
        <script>
      const currentYear = new Date().getFullYear();
      document.getElementById(
        "currentYearLabel"
      ).textContent = `ყველა უფლება დაცულია © ${currentYear}`;
    </script>
        <script>
    document.getElementById('patient-status').addEventListener('change', function() {
        var selectedValue = this.value;
        var capableDiv = document.querySelector('.patient-signature.capable');
        var noncapableDiv = document.querySelector('.patient-signature.noncapable');
        var cantsignDiv = document.querySelector('.patient-signature.cantsign');

        capableDiv.style.display = 'none';
        noncapableDiv.style.display = 'none';
        cantsignDiv.style.display = 'none';

        if (selectedValue === 'capable') {
            capableDiv.style.display = 'block';
        } else if (selectedValue === 'noncapable') {
            noncapableDiv.style.display = 'block';
        } else if (selectedValue === 'cantsign') {
            cantsignDiv.style.display = 'block';
        }
    });
</script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>