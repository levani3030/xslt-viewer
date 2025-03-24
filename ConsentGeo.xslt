<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="format-detection" content="telephone=no" />
        <meta name="print-color-adjust" content="exact" />
        <title>ინფორმირებული თამხმობა</title>
        <style>
@import url("//cdn.web-fonts.ge/fonts/bpg-nateli/css/bpg-nateli.min.css");
@import url("//cdn.web-fonts.ge/fonts/bpg-mrgvlovani-caps/css/bpg-mrgvlovani-caps.min.css");
@import url("//cdn.web-fonts.ge/fonts/bpg-arial/css/bpg-arial.min.css");

*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

html, body {
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
    font-family: "BPG Mrgvlovani Caps", sans-serif;
    display: flex;
    font-size: 1.2rem;
    font-weight: 800;
    color: #000;
    text-align: center;
    justify-content: center;
    margin: 1rem 0;
}

.patient-info {
  font-family: "BPG Arial", sans-serif;
    border-radius: 1rem;
    display: flex;
    justify-content: flex-start;
    padding: 0.7rem;
    width: 100%
}

.patient-info-wrapper {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    width: 100%;
    justify-content: space-between;
    align-content: space-between;
}

.patient-info-box {
    background-color: rgba(200, 200, 200, 0.2);
    border-radius: 1rem;
    padding: 1rem;
    line-height: 1.5;
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}
.patient-info-box-wrapper {
    display: flex;
    align-items: flex-start;
    justify-content: flex-start;
}
.patient-info-content {
    font-size: .8rem;
}

.patient-info-box-wrapper span {
    font-weight: 800;
    font-size: .8rem;
    margin-left: 0.5rem;
}

.patient-info-fullname {
    padding-left: .5rem;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
}

.patient-info-data p {
    color: #000;
    width: 100%;
    font-weight: 900;
    margin-left: 0.1rem;
}

.document-signed {
    display: none;
    position: absolute;
    right: 4rem;
    border: solid 0.2rem rgb(67, 175, 51);
    padding: 0.5rem 1rem;
    color: rgb(67, 175, 51);
    font-weight: 900;
    border-radius: 0.5rem;
}
.patient-signature-info {
    padding: 0.5rem 0;
    font-size: 0.8rem;
    text-wrap: wrap;
    width: auto;
}
.selfsign {
  display: none;
}
.othersign {
  display: none;
}
.patient-status-dropdown {
    background-color: rgba(200, 200, 200, 0.2);
    border: 1px solid #000;
    max-width: 22rem;
    border-radius: 0.5rem;
    padding: 0.5rem 0.5rem;
    position: relative;
    display: inline-block;
}

.patient-status {
    border: none;
    text-align: center;
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
    padding: 0 0.5rem;
    line-height: 1.5;
}

.patient-status-dropdown-icon {
    position: absolute;
    top: 40%;
    right: .75rem;
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #000;
    pointer-events: none;
}

.patient-status option {
    padding: 0.5rem 1.5rem;
    line-height: 1.5;
}

.consent-section {
    font-family: "BPG Nateli", sans-serif;
    font-size: 0.9rem;
    width: 100%;
    background-color: rgba(200, 200, 200, 0.2);
    border-radius: 1rem;
    padding: 0.7rem;
}

.consent-section ul {
    display: flex;
    flex-direction: column;
    text-align: justify;
    gap: 0.5rem;
    padding-left: 1rem;
}

.patient-section {
  font-family: "BPG Arial", sans-serif;
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin: 1rem 0;
}
.patient-sign-choose {
    display: flex;
    gap: 0.5rem;
    align-items: center;
    text-align: center;
    justify-content: flex-start;
}
.patient-section-wrapper {
  display: flex;
  gap: 1rem;
  align-items: center;
}
.patient-signature {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    gap: 1rem;
}

.patient-signature-box {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: flex-start;
  width: 100%;
}
.patient-signature-container {
    background-color: rgba(200, 200, 200, 0.2);
    border-radius: 1rem;
    display: flex;
    justify-content: space-between;
    padding: 1rem;
    width: 100%;
}

.patient-signature-noncapable {
    max-width: 80rem;
    display: flex;
    flex-direction: row !important;
}

.patient-sign-container {
    background-color: rgba(200, 200, 200, 0.2);
    border-radius: 1rem;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    padding: 1rem;
    width: 100%;
}

.patient-sign-status {
    font-size: .8rem;
    font-weight: 400;
    display: none;
    flex-direction: column;
    align-items: flex-end;
    gap: 1rem;
    margin-right: 1rem;
}
.patient-sign-status span {
    font-weight: 900;
}
.patient-signature-wrapper {
    display: flex;
    gap: 0.7rem;
    align-items: flex-start;
    text-align: center;
    justify-content: flex-start;
    flex-direction: column;
}
.patient-signature-wrapper span {
  font-weight: 800;
  padding-left: 0.5rem;
}

.patient-signature-id {
    padding-left: 1rem;
}

.patient-sign-date {
  font-size: 0.8rem;
}

.patient-signature-wrapper input, .patient-signature-id input {
    width: 16rem;
    padding: 0.2rem 0.5rem;
    border-radius: 0.5rem;
    border: 1px solid #000;
    font-size: 1rem;
}
.patient-signature-checkbox-container {
    background-color: rgba(200, 200, 200, 0.2);
    border-radius: 1rem;
    padding: 1rem;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}
.patient-signature-checkbox-wrapper {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 0.7rem;
}
.patient-signature-checkbox {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 0.5rem;
}

.patient-signature-date {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 1rem;
}

.footer {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 2rem;
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

/* SVG ინფორმაციის ბლოკის სტილები */
.info-tooltip {
    position: absolute;
    top: 50px;
    left: 50px;
    width: 250px;
    padding: 15px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    opacity: 0;
    transform: translateY(10px);
    transition: opacity 0.3s, transform 0.3s;
    pointer-events: none;
    z-index: 10;
    font-family: "BPG Arial", sans-serif;
    font-size: 0.8rem;
}

.info-tooltip.visible {
    opacity: 1;
    transform: translateY(0);
    pointer-events: auto;
}

.info-tooltip .close-btn {
    position: absolute;
    top: 5px;
    right: 5px;
    background: none;
    border: none;
    font-size: 16px;
    cursor: pointer;
    color: #888;
}

.info-tooltip .close-btn:hover {
    color: #333;
}

#info-svg {
    cursor: pointer;
    transition: transform 0.3s;
}

#info-svg:hover {
    transform: scale(1.05);
}

@media print {
    .patient-status-dropdown {
        border: none !important;
        border-radius: 0 !important;
        display: inline-block !important;
        padding: 0.5rem 0 !important;
    }
    
    .patient-status {
        display: inline-block !important;
        appearance: none !important;
        -webkit-appearance: none !important;
        -moz-appearance: none !important;
        font-size: 11pt !important;
        font-weight: 800 !important;
        width: 20rem !important;
    }
    
    .patient-status-dropdown-icon {
        display: none !important;
    }
    .patient-sign-status {
        display: flex !important;
        font-size: 8pt !important;
    }
    .consent-section {
      font-size: 9pt !important;
    }
    .doctitle {
      font-size: 10pt !important;
    }
    input {
        border: none !important;
        border-radius: 0 !important;
        display: inline-block !important;
        padding: 0.3rem 0 !important;
    }
    .patient-signature-checkbox {
      font-size: 10pt !important;
    }
    .document-signed {
      display: block !important;
    }
    .patient-signature-wrapper input {
      width: 18rem !important;
      font-weight: 800 !important;
    }
    button {
      display: none !important;
    }
    .info-tooltip {
        display: none !important;
    }
    .patient-sign-choose {
        display: none !important;
    }
}
        </style>
      </head>
      <body>
        <header>
          <div class="clinic-logo">
          </div>
        </header>
        <div class="main-wrapper">
          <div class="doctitle">
            <p>პაციენტის წერილობითი, ინფორმირებული თანხმობა სამედიცინო მომსახურების გაწევაზე</p>
          </div>
          <div class="patient-info">
            <div class="patient-info-wrapper">
              <div class="patient-info-box">
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-content">სახელი და გვარი:
                </p>
                  <div class="patient-info-fullname">
                    <span>
                      <xsl:value-of select="/Root/Firstname"/>
                    </span>
                    <span>
                      <xsl:value-of select="/Root/Lastname"/>
                    </span>
                  </div>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-content">ელ-ფოსტა:
                </p>
                  <span>
                    <xsl:value-of select="/Root/Email"/>
                  </span>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-content">პირადი ნომერი:</p>
                  <span>
                    <xsl:value-of select="/Root/PersonalId"/>
                  </span>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-content">ტელეფონი:</p>
                  <span>
                    <xsl:value-of select="/Root/PhoneNumber"/>
                  </span>
                </div>
                <div class="patient-info-box-wrapper">
                  <p class="patient-info-content">მისამართი:</p>
                  <span>
                    <xsl:value-of select="/Root/Address"/>
                  </span>
                </div>
              </div>
              <div class="document-signed">
                <p>ხელმოწერილი</p>
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
            ხელს ვაწერ რა დოკუმენტს, ვიძლევი თანხმობას პაციენტისათვის აუცილებელი ყველა სამკურნალო ღონისძიების ჩატარებაზე და მათ შესრულებას ვანდობ სს "კ. ერისთავის სახ. ექსპერიმენტული და კლინიკური ქირურგიის ეროვნული ცენტრი"-ს პერსონალს.
          </li>
              <li>
            ვაცნობიერებ, რომ მკურნალობის მსვლელობისას შესაძლებელია წარმოიშვას არასტანდარტული სიტუაციები,
            გაუთვალისწინებელი გარემოებები და გართულებები და რომ ამ შემთხვევაში მკურნალობის ტაქტიკა და ტექნოლოგიები შეიძლება
            შეცვლილი იქნეს ექიმის მიერ. წარმოშობილი სიტუაციის შესაბამისად, ავადმყოფის ინტერესებიდან გამომდინარე შესაძლებელია, პაციენტს დამატებით ჩაუტარდეს გამოკვლევები, ინტენსიური თერაპია, ოპერაციები, ფილტვების ხელოვნური ვენტილაცია,
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
            ყველა გარემოება. ისეთი ფაქტების დამალვის შემთხვევაში (ალერგიული გამოვლინებები, წამლების ინდივიდუალური აუტანლობა,
            ჩატარებული ჰემოტრანსფუზიები, აგრეთვე ნარკოტიკებისა და ალკოჰოლის ბოროტად გამოყენება, თანმხლები დაავადებები), რომლებმაც შესაძლოა გავლენა იქონიონ მკურნალობაზე და მის შედეგებზე, სამედიცინო პერსონალი იხსნის პასუხისმგებლობას.
          </li>
              <li>
          ინფორმირებული ვარ იმის შესახებ, რომ ოპერაციამდე, ოპერაციის მსვლელობისას, მას შემდეგ ან მის გარეშე შესაძლებელია
          სისხლის დაკარგვა ან მისი აუცილებელი გადასხმა. მიღებული მაქვს გარკვეული ინფორმაცია სისხლისა და მისი კომპონენტების
          ტრანსფუზიის არსისა და შესაძლო გართულებების შესახებ და ვიძლევი თანხმობას ღონისძიებების ჩატარებაზე ჩემი დამატებითი
          ინფორმაციის გარეშე.
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
            </ul>
          </section>
          <section class="patient-section">
            <div class="patient-sign-choose">
              <div class="patient-status-dropdown">
                <select name="patient-status" id="patient-status" class="patient-status">
                  <option value="capable" selected="selected">პაციენტი თავად აწერს ხელს</option>
                  <option value="noncapable">პაციენტის მაგივრად სხვა აწერს ხელს</option>
                </select>
                <span class="patient-status-dropdown-icon"></span>
              </div>
              <div style="position: relative;">
                <svg id="info-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" width="40px" height="40px">
                  <path d="M 32 10 C 19.85 10 10 19.85 10 32 C 10 44.15 19.85 54 32 54 C 44.15 54 54 44.15 54 32 C 54 19.85 44.15 10 32 10 z M 32 14 C 41.941 14 50 22.059 50 32 C 50 41.941 41.941 50 32 50 C 22.059 50 14 41.941 14 32 C 14 22.059 22.059 14 32 14 z M 32 21 C 30.343 21 29 22.343 29 24 C 29 25.657 30.343 27 32 27 C 33.657 27 35 25.657 35 24 C 35 22.343 33.657 21 32 21 z M 32 30 C 30.895 30 30 30.896 30 32 L 30 42 C 30 43.104 30.895 44 32 44 C 33.105 44 34 43.104 34 42 L 34 32 C 34 30.896 33.105 30 32 30 z"/>
                </svg>
                <div class="info-tooltip" id="infoTooltip">
                  <button class="close-btn" id="closeTooltipBtn">×</button>
                  <h3>ინფორმაცია</h3>
                  <p>აირჩიეთ პაციენტის სტატუსი: თუ პაციენტი თავად აწერს ხელს ან თუ მის მაგივრად სხვა აწერს ხელს.</p>
                </div>
              </div>
              <div class="patient-signature-info">
                <p id="selfsign" class="selfsign">ივსება იმ შემთხვევაში, როდესაც პაციენტი თავად აწერს ხელს</p>
                <p id="othersign" class="othersign">ივსება იმ შემთხვევაში, როდესაც პაციენტი თავად ვერ ან არ აწერს ხელს, ჯანმრთელობის მდგომარეობის თუ სხვა მიზეზის გამო</p>
              </div>
            </div>
            <div class="patient-signature capable">
              <div class="patient-signature-box">
                <div class="patient-signature-container">
                  <div class="patient-signature-wrapper">
                    <p>სახელი და გვარი:
                      <span>
                        <xsl:value-of select="/Root/Firstname"/>
                      </span>
                      <span>
                        <xsl:value-of select="/Root/Lastname"/>
                      </span>
                    </p>
                    <p>დოკუმენტის ნომერი:
                      <span>
                        <xsl:value-of select="/Root/PersonalId"/>
                      </span>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="patient-signature noncapable" style="display: none;">
              <div class="patient-signature-box">
                <div class="patient-signature-container">
                  <div class="patient-signature-wrapper">
                    <p>წარმომადგენლის სახელი და გვარი:
                      <input type="text"/>
                    </p>
                    <p>პირადი დოკუმენტის ნომერი:
                      <input type="text"/>
                    </p>
                    <p>ნათესაური კავშირი (ახლობელი):
                      <input type="text"/>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="patient-signature-checkbox-container">
              <div class="patient-signature-checkbox-wrapper">
                <label class="patient-signature-checkbox">
                  <input type="checkbox" name="checkbox" />მონიშვნით ვადასტურებ რომ გავეცანი და ვეთანხმები დოკუმენტის ყველა პუნქტს.
                </label>
                <label class="patient-signature-checkbox">
                  <input type="checkbox" name="checkbox" />მონიშვნით ვადასტურებ პერსონალური მონაცემების სისწორეს.
                </label>
                <label class="patient-signature-checkbox">
                  <input type="checkbox" name="checkbox" />მონიშვნით სურვილს გამოვთქვავ მივიღო შეტყობინება კვლევის შედეგების თუ სხვა 
                  სახის ინფომაციის მიღებაზე.
                </label>
              </div>
            </div>
            <div class="patient-sign-container">
              <div class="patient-signature-wrapper">
                <p>ხელმოწერა:</p>
                <div class="patient-signature-form">_________________________</div>
              </div>
              <div class="patient-sign-date">
                <p>ხელმოწერის თარიღი:
                  <xsl:value-of select="concat(substring(/Root/Today, 9, 2), '.', substring(/Root/Today, 6, 2), '.', substring(/Root/Today, 1, 4))"/>
                </p>
              </div>
            </div>
            <div class="patient-sign-status">
              <p>დოკუმენტის სტატუსი:
                <span>ხელმოწერილი</span>
              </p>
            </div>
          </section>
        </div>
        <script>
      const currentYear = new Date().getFullYear();
      document.getElementById(
        "currentYearLabel"
      ).textContent = `ყველა უფლება დაცულია © ${currentYear}`;
    </script>
<script>
  // ნაგულისხმევი მდგომარეობა
  document.getElementById("selfsign").style.display = "block";
  document.getElementById("othersign").style.display = "none";

  document.getElementById("patient-status").addEventListener("change", function () {
    const status = this.value;
    const capableSection = document.querySelector(".patient-signature.capable");
    const noncapableSection = document.querySelector(".patient-signature.noncapable");
    
    if (status === "capable") {
      capableSection.style.display = "block";
      noncapableSection.style.display = "none";
      document.getElementById("selfsign").style.display = "block";
      document.getElementById("othersign").style.display = "none";
    } else {
      capableSection.style.display = "none";
      noncapableSection.style.display = "block";
      document.getElementById("selfsign").style.display = "none";
      document.getElementById("othersign").style.display = "block";
    }
  });
</script>

<script>
    // SVG ინფორმაციის ბლოკის ფუნქციონალი
    const svgElement = document.getElementById('info-svg');
    const infoTooltip = document.getElementById('infoTooltip');
    const closeTooltipBtn = document.getElementById('closeTooltipBtn');
    
    let isTooltipClicked = false;
    
    // მაუსის გადატარება SVG-ზე
    svgElement.addEventListener('mouseenter', function() {
        if (!isTooltipClicked) {
            infoTooltip.classList.add('visible');
        }
    });
    
    // მაუსის SVG-დან გასვლა
    svgElement.addEventListener('mouseleave', function() {
        if (!isTooltipClicked) {
            infoTooltip.classList.remove('visible');
        }
    });
    
    // დაწკაპუნება SVG-ზე
    svgElement.addEventListener('click', function() {
        isTooltipClicked = true;
        infoTooltip.classList.add('visible');
    });
    
    // დახურვის ღილაკი
    closeTooltipBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        isTooltipClicked = false;
        infoTooltip.classList.remove('visible');
    });
</script>

</script>
        <script>
    // Optional: Add a print button for easier access
    if (!window.matchMedia('print').matches) { // Don't show in print mode
      const printBtn = document.createElement('button');
      printBtn.innerText = 'დაბეჭდვა';
      printBtn.className = 'print-button';
      printBtn.style.cssText = 'position: fixed; top: 10px; right: 10px; padding: 8px 16px; background: #0066cc; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; z-index: 9999;';
      printBtn.onclick = function() { window.print(); };
      document.body.appendChild(printBtn);
    }
    </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>